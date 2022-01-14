import 'package:date_time_picker/date_time_picker.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:umsukoas/components/defaultButton.dart';
import 'package:umsukoas/restapi/api_services.dart';
import '../../../config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class TambahFollowUp extends StatefulWidget {
  @override
  _TambahFollowUpState createState() => _TambahFollowUpState();
}

class _TambahFollowUpState extends State<TambahFollowUp> {
  APIService apiService;
  String selectedValueRs, selectedValueDoping, waktuKegiatan;
  final List<DropdownMenuItem<String>> itemsRumahSakit = [];
  final List<DropdownMenuItem<String>> itemsDokter = [];
  int maxLengthJudul = 150;
  String text = "";
  FocusNode _focusNode;
  HtmlEditorController htmlcontroller = HtmlEditorController();

  @override
  void initState() {
    apiService = new APIService();
    _focusNode = FocusNode();
    waktuKegiatan = DateTime.now().toString();
    initKegiatan();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> initKegiatan() async {
    itemsRumahSakit.clear();
    apiService.getInitKegiatan(Config.npm).then((value) {
      for (var i = 0; i < value.length; i++) {
        itemsRumahSakit.add(DropdownMenuItem(
          child: Text(
            value[i].rumahSakitNama.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          value: value[i].rumahSakitDetailId,
        ));
      }
      setState(() {});
    });
  }

  Future<void> getDoping(String rsId) async {
    itemsDokter.clear();
    apiService.getDoping(rsId).then((value) {
      for (var i = 0; i < value.length; i++) {
        itemsDokter.add(DropdownMenuItem(
          child: Text(
            value[i].dopingNamaLengkap.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          value: value[i].dopingId,
        ));
      }
      setState(() {});
    });
  }

  Future<void> saveFollowUp(rumkitDetId, dopingId, nim, tanggal, deskripsi) {
    apiService
        .saveFollowUp(rumkitDetId, dopingId, nim, tanggal, deskripsi)
        .then(
      (ret) {
        print(ret.toJson());
        if (ret.status) {
          SweetAlert.show(
            context,
            title: "KOAS UMSU",
            subtitle: ret.message,
            style: SweetAlertStyle.success,
          );
        } else {
          SweetAlert.show(
            context,
            title: "KOAS UMSU",
            subtitle: ret.message,
            style: SweetAlertStyle.error,
          );
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DateTimePicker(
              type: DateTimePickerType.dateTimeSeparate,
              dateMask: 'dd MMM, yyyy',
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event),
              dateLabelText: 'Tanggal',
              timeLabelText: "Jam",
              selectableDayPredicate: (date) {
                if (date.weekday == 6 || date.weekday == 7) {
                  return false;
                }
                return true;
              },
              onChanged: (val) {
                print(val);
                waktuKegiatan = val;
              },
              validator: (val) {
                print(val);
                waktuKegiatan = val;
                return null;
              },
              onSaved: (val) => print(val),
            ),
            Divider(),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                hintText: "Pilih Rumah Sakit",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              value: selectedValueRs,
              onChanged: (String newValue) {
                setState(() {
                  selectedValueRs = newValue;
                  print(selectedValueRs);
                  getDoping(selectedValueRs);
                });
              },
              items: itemsRumahSakit,
            ),
            Divider(),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                hintText: "Pilih Pembimbing",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
              value: selectedValueDoping,
              onChanged: (String newValue) {
                setState(() {
                  selectedValueDoping = newValue;
                  print(selectedValueDoping);
                });
              },
              items: itemsDokter,
            ),
            Divider(),
            ExpandableNotifier(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          iconColor: kPrimaryColor,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Isi Kasus (Metode SOAP)",
                              style: TextStyle(fontSize: 18),
                            )),
                        collapsed: Text(
                          "Klik Untuk Membuka Editor Text",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: HtmlEditor(
                                htmlToolbarOptions: HtmlToolbarOptions(
                                  toolbarPosition:
                                      ToolbarPosition.aboveEditor, //by default
                                  toolbarType:
                                      ToolbarType.nativeScrollable, //by default
                                ),
                                controller: htmlcontroller, //required
                                htmlEditorOptions: HtmlEditorOptions(
                                  hint: "Your text here...",
                                ),
                                otherOptions: OtherOptions(
                                  height: getProportionateScreenHeight(500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            DefaultButton(
              text: "Simpan",
              background: kPrimaryColor,
              color: Colors.white,
              press: () async {
                var txt = await htmlcontroller.getText();
                if (txt.contains('src=\"data:')) {
                  txt =
                      '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                }
                final progress = ProgressHUD.of(context);
                progress?.show();
                Future.delayed(Duration(seconds: 1), () {
                  saveFollowUp(selectedValueRs, selectedValueDoping, Config.npm,
                      waktuKegiatan, txt);
                  progress?.dismiss();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
