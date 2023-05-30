import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_nilai_pim.dart';
import 'package:umsukoas/restapi/api_services.dart';
import 'package:umsukoas/screen/pim/components/stickyPim.dart';

import '../../../config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class NilaiPim extends StatefulWidget {
  @override
  State<NilaiPim> createState() => _NilaiPimState();
}

class _NilaiPimState extends State<NilaiPim> {
  final List<DropdownMenuItem<String>> itemsSemester = [];
  String selectedValueSemester;
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    initRaportPim();
    super.initState();
  }

  Future<void> initRaportPim() async {
    itemsSemester.clear();
    apiService.getSemesterNilaiPim(Config.npm).then((value) {
      for (var i = 0; i < value.length; i++) {
        itemsSemester.add(DropdownMenuItem(
          child: Text(
            'Semester ' + value[i].pimGradeSemester.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          value: value[i].pimGradeSemester,
        ));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                });
              },
              items: itemsSemester,
            ),
            Divider(),
            FutureBuilder(
              future:
                  apiService.getMyNilaiPim(Config.npm, selectedValueSemester),
              builder: (
                BuildContext context,
                AsyncSnapshot<MyNilaiPim> model,
              ) {
                if (model.hasData) {
                  return _buildMyNilai(model.data);
                }
                return Container(
                  height: SizeConfig.screenHeight / 1.5,
                  child: LodingWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMyNilai(MyNilaiPim myNilai) {
  return myNilai.status
      ? Column(
          children: [
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: myNilai.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return StickyPim(
                    kegiatan: myNilai.data[index].pimKategoriNama,
                    ket: myNilai.data[index].pimKegiatanNama,
                    total: myNilai.data[index].pimNilaiTotal,
                    skor: myNilai.data[index].pimNilaiSkor,
                    hasil: myNilai.data[index].pimNilaiHasil,
                  );
                },
              ),
            ),
            SizedBox(height: 20)
          ],
        )
      : Center(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(100)),
              Container(
                child: Lottie.asset(
                  'asset/lotties/relax.json',
                  width: 250,
                ),
              ),
              Text(
                "Tidak ada penilaian",
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
        );
}
