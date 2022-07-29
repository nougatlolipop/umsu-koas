import 'package:date_time_picker/date_time_picker.dart';
import 'package:expandable/expandable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:umsukoas/components/defaultButton.dart';
import 'package:umsukoas/restapi/api_services.dart';
import '../../../config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter/services.dart';

class TambahKegiatan extends StatefulWidget {
  @override
  _TambahKegiatanState createState() => _TambahKegiatanState();
}

class _TambahKegiatanState extends State<TambahKegiatan> {
  APIService apiService;
  String selectedValueRs,
      selectedValueDoping,
      selectedValueKegiatan,
      waktuKegiatan;
  final List<DropdownMenuItem<String>> itemsRumahSakit = [];
  final List<DropdownMenuItem<String>> itemsDokter = [];
  final List<DropdownMenuItem<String>> itemsKegiatan = [];
  TextEditingController judul = TextEditingController();
  int maxLengthJudul = 150;
  String text = "";
  HtmlEditorController htmlcontroller = HtmlEditorController();
  List<PlatformFile> _paths;
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  bool _isLoading = false;
  String _fileName;
  bool _userAborted = false;
  String _directoryPath;
  String _saveAsFileName;
  String _extension;
  FileType _pickingType = FileType.any;

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _saveAsFileName = null;
      _userAborted = false;
    });
  }

  void _pickFiles() async {
    _resetState();
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['docx', 'doc'],
      ))
          .files;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
    print("File base:$_paths");
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
  }

  void _clearCachedFiles() async {
    _resetState();
    try {
      bool result = await FilePicker.platform.clearTemporaryFiles();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    apiService = new APIService();
    waktuKegiatan = DateTime.now().toString();
    initKegiatan();
    super.initState();
  }

  void bersih() {
    itemsRumahSakit.clear();
    itemsDokter.clear();
    itemsKegiatan.clear();
    judul.clear();
    htmlcontroller.clear();
  }

  void _logException(String message) {
    print(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    bersih();
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

  Future<void> getKegiatan() async {
    itemsKegiatan.clear();
    apiService.getKegiatan(Config.npm).then((value) {
      for (var i = 0; i < value.length; i++) {
        itemsKegiatan.add(DropdownMenuItem(
          child: Text(
            value[i].kegiatanNama.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          value: value[i].kegiatanId,
        ));
      }
      setState(() {});
    });
  }

  simpanLogbook(BuildContext context) async {
    var txt = await htmlcontroller.getText();
    if (txt.contains('src=\"data:')) {
      txt =
          '<text removed due to base-64 data, displaying the text could cause the app to crash>';
    }
    final progress = ProgressHUD.of(context);
    progress?.show();
    Future.delayed(Duration(seconds: 1), () {
      saveLogbook(selectedValueRs, selectedValueDoping, selectedValueKegiatan,
          Config.npm, waktuKegiatan, judul.text, txt);
      progress?.dismiss();
    });
    //
  }

  Future<void> saveLogbook(rumkitDetId, dopingId, selectedValueKegiatan, nim,
      tanggal, judul, deskripsi) async {
    // print(_paths.first.name);
    if (_paths == null) {
      apiService
          .saveLogbook(rumkitDetId, dopingId, selectedValueKegiatan, nim,
              tanggal, judul, deskripsi)
          .then(
        (ret) {
          bersih();
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
          _resetState();
        },
      );
    } else {
      apiService
          .saveLogbookWithFile(rumkitDetId, dopingId, selectedValueKegiatan,
              nim, tanggal, judul, deskripsi, _paths)
          .then(
        (ret) {
          bersih();
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
          _resetState();
        },
      );
    }
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
              // selectableDayPredicate: (date) {
              //    if (date.weekday == 6 || date.weekday == 7) {
              //      return false;
              //    }
              //   return true;
              // },
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
                  getKegiatan();
                });
              },
              items: itemsDokter,
            ),
            Divider(),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                hintText: "Pilih Kegiatan",
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
              value: selectedValueKegiatan,
              onChanged: (String newValue) {
                setState(() {
                  selectedValueKegiatan = newValue;
                  print(selectedValueKegiatan);
                });
              },
              items: itemsKegiatan,
            ),
            Divider(),
            TextField(
              controller: judul,
              minLines: null,
              maxLength: maxLengthJudul,
              onChanged: (String newVal) {
                if (newVal.length <= maxLengthJudul) {
                  text = newVal;
                } else {
                  judul.value = new TextEditingValue(
                    text: text,
                    selection: new TextSelection(
                        baseOffset: maxLengthJudul,
                        extentOffset: maxLengthJudul,
                        affinity: TextAffinity.downstream,
                        isDirectional: false),
                    composing: new TextRange(start: 0, end: maxLengthJudul),
                  );
                  judul.text = text;
                }
              },
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              decoration: InputDecoration(
                focusColor: kPrimaryColor,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 10.0),
                hintText: "Judul Deskripsi",
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
                              "Isi Deskripsi Kegiatan",
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
                            GestureDetector(
                              onTap: () {
                                if (!kIsWeb) {
                                  htmlcontroller.clearFocus();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: HtmlEditor(
                                  htmlToolbarOptions: HtmlToolbarOptions(
                                    toolbarPosition: ToolbarPosition
                                        .aboveEditor, //by default
                                    toolbarType: ToolbarType
                                        .nativeScrollable, //by default
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
            Text(
              _fileName == null ? "No file selected" : _fileName,
              style: TextStyle(color: kPrimaryColor),
            ),
            Divider(),
            DefaultButton(
              text: _fileName == null ? "Pilih Berkas" : "Batalkan",
              background: kPrimaryColor,
              color: Colors.white,
              press: () async {
                _fileName == null ? _pickFiles() : _clearCachedFiles();
              },
            ),
            Divider(),
            DefaultButton(
              text: "Simpan",
              background: kPrimaryColor,
              color: Colors.white,
              press: () async {
                simpanLogbook(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
