import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:umsukoas/components/defaultButton.dart';
import 'package:umsukoas/models/model_sub_kegiatan_pim.dart';
import 'package:umsukoas/restapi/api_services.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../config.dart';

class TambahPIM extends StatefulWidget {
  @override
  _TambahPIMState createState() => _TambahPIMState();
}

class _TambahPIMState extends State<TambahPIM> {
  APIService apiService;
  String selectedValueKegiatan,
      selectedValueSemester,
      selectedValueSubKegiatan,
      namaDosenPembimbing,
      waktuKegiatan;
  final List<DropdownMenuItem<String>> itemsKegiatan = [];
  final List<DropdownMenuItem<String>> itemsSemester = [];
  final List<DropdownMenuItem<String>> itemsSubKegiatan = [];
  TextEditingController judul = TextEditingController();
  TextEditingController link = TextEditingController();
  int maxLengthJudul = 150;
  String text = "";
  List<PlatformFile> _paths;
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  bool isSelect = false;
  bool _isLoading = false;
  String _fileName;
  bool _userAborted = false;
  String _directoryPath;
  String _saveAsFileName;
  String _extension;
  FileType _pickingType = FileType.any;
  bool visibleUpload = false;
  bool visibleDosen = false;
  List<ModelSubKegiatanPim> jumlah = [];

  @override
  void initState() {
    apiService = new APIService();
    waktuKegiatan = DateTime.now().toString();
    keterangan();
    getSemester();
    super.initState();
  }

  void bersih() {
    itemsKegiatan.clear();
    judul.clear();
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
    // setState(() {});
    super.dispose();
  }

  Future<void> getSemester() async {
    itemsSemester.clear();
    apiService.getSemesterPim(Config.npm).then((value) {
      for (var i = 0; i < value.length; i++) {
        itemsSemester.add(DropdownMenuItem(
          child: Text(
            'Semester ' + value[i].pimJadwalSemester,
            overflow: TextOverflow.ellipsis,
          ),
          value: value[i].pimJadwalSemester,
        ));
      }
      setState(() {});
    });
  }

  Future<void> getKegiatan() async {
    itemsKegiatan.clear();
    apiService.getKegiatanPim().then((value) {
      for (var i = 0; i < value.length; i++) {
        itemsKegiatan.add(DropdownMenuItem(
          child: Text(
            value[i].pimKategoriNama.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          value: value[i].pimKategoriId + ',' + value[i].pimKategoriIsSelect,
        ));
      }
      setState(() {});
    });
  }

  Future<void> keterangan() async {
    if (selectedValueSemester != null && jumlah.length == 0) {
      if (selectedValueKegiatan == null) {
        namaDosenPembimbing = 'Pilih Kategori kegiatan dulu !';
      } else {
        namaDosenPembimbing =
            'Dosen Pembimbing Belum Ditugaskan, Hubungi Koodinator PIM !';
      }
      visibleDosen = false;
    } else if (selectedValueSemester != null && jumlah.length > 0) {
      namaDosenPembimbing = jumlah[0].dopingNamaLengkap.toString();
      visibleDosen = true;
    } else if (selectedValueSemester == null && jumlah.length == 0) {
      namaDosenPembimbing = 'Pilih Semester dulu !';
      visibleDosen = false;
    }
  }

  Future<void> getSubKegiatan(idKategori) async {
    itemsSubKegiatan.clear();
    apiService.getSubKegiatanPim(idKategori, Config.npm).then((value) {
      for (var i = 0; i < value.length; i++) {
        itemsSubKegiatan.add(DropdownMenuItem(
          child: Text(
            value[i].pimKegiatanNama.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          value: value[i].pimKegiatanId,
        ));
      }
      setState(() {
        jumlah = value;
        keterangan();
        print(jumlah);
      });
    });
  }

  simpanLogbook() async {
    Future.delayed(Duration(seconds: 1), () {
      var save = {};
      selectedValueKegiatan.split(',')[0] == '1'
          ? save = {
              'waktu': waktuKegiatan,
              'semester': selectedValueSemester,
              'kategori': selectedValueKegiatan.split(',')[0],
              'judul': judul.text,
              'kegiatan': null,
              'link': link.text
            }
          : save = {
              'waktu': waktuKegiatan,
              'semester': selectedValueSemester,
              'kategori': selectedValueKegiatan.split(',')[0],
              'kegiatan': selectedValueSubKegiatan.split(',')[0],
              'judul': null,
              'link': link.text
            };
      savePim(save);
    });
  }

  Future<void> savePim(data) async {
    print(data);
    apiService
        .saveKegiatanPim(Config.npm, data['waktu'], data['semester'],
            data['kategori'], data['kegiatan'], data['judul'], data['link'])
        .then(
      (ret) {
        setState(() {});
        // print(ret.toJson());

        SweetAlert.show(
          context,
          title: "KOAS UMSU",
          subtitle: ret.message,
          style: ret.status ? SweetAlertStyle.success : SweetAlertStyle.error,
        );
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
                hintText: "Pilih Semester",
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
              value: selectedValueSemester,
              onChanged: (String newValue) {
                setState(() {
                  selectedValueSemester = newValue;
                  print(selectedValueSemester);
                  getKegiatan();
                  keterangan();
                });
              },
              items: itemsSemester,
            ),
            Divider(),
            DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                hintText: "Pilih Kategori",
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
                  selectedValueKegiatan.split(',')[1] == '1'
                      ? isSelect = true
                      : isSelect = false;
                  print(selectedValueKegiatan.split(',')[0]);
                  getSubKegiatan(selectedValueKegiatan.split(',')[0]);
                  keterangan();
                });
              },
              items: itemsKegiatan,
            ),
            (visibleDosen)
                ? Container(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenWidth(15)),
                    child: Column(
                      children: [
                        Text(
                          'Akan Dibimbing Oleh :',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          '${namaDosenPembimbing}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenWidth(15)),
                    child: Text(
                      '${namaDosenPembimbing}',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                      ),
                    ),
                  ),
            Divider(),
            (!isSelect)
                ? TextField(
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
                          composing:
                              new TextRange(start: 0, end: maxLengthJudul),
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
                  )
                : DropdownButtonFormField(
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
                    value: selectedValueSubKegiatan,
                    onChanged: (String newValue) {
                      setState(() {
                        selectedValueSubKegiatan = newValue;
                      });
                    },
                    items: itemsSubKegiatan,
                  ),
            Divider(),
            TextField(
              controller: link,
              minLines: null,
              onChanged: (String newVal) {
                text = newVal;
              },
              maxLines: 1,
              decoration: InputDecoration(
                focusColor: kPrimaryColor,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 10.0),
                hintText: "Alamat Link",
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
            DefaultButton(
              text: "Simpan",
              background: kPrimaryColor,
              color: Colors.white,
              press: () async {
                simpanLogbook();
              },
            ),
          ],
        ),
      ),
    );
  }
}
