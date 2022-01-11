import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/restapi/api_services.dart';
import 'package:umsukoas/size_config.dart';
import 'package:universal_html/js.dart';

import '../../../config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
  QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    apiService = new APIService();
    initKegiatan();
    super.initState();
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
          value: value[i].rumahSakitId,
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
    apiService.getKegiatan().then((value) {
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

  @override
  Widget build(BuildContext context) {
    var quillEditor = QuillEditor(
      controller: _controller,
      scrollController: ScrollController(),
      scrollable: true,
      focusNode: _focusNode,
      autoFocus: false,
      readOnly: false,
      placeholder: 'Isi Deskripsi',
      expands: false,
      padding: EdgeInsets.all(8.0),
    );
    return Scaffold(
      appBar: MyAppBar(
        title: "Kegiatan",
        action: <Widget>[
          TextButton(
            onPressed: () {
              print(_controller.document.toDelta().toJson());
            },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
      body: Container(
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
              Container(
                height: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: quillEditor,
                      ),
                    ),
                    QuillToolbar.basic(controller: _controller),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RenderBox _findBorderBox(RenderBox box) {
    RenderBox borderBox;

    box.visitChildren((child) {
      if (child is RenderCustomPaint) {
        borderBox = child;
      }

      final box = _findBorderBox(child as RenderBox);
      if (box != null) {
        borderBox = box;
      }
    });

    return borderBox;
  }
}
