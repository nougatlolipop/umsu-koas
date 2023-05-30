import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_nilai.dart';
import 'package:umsukoas/restapi/api_services.dart';
import 'package:umsukoas/screen/nilai/components/sticky.dart';
import 'package:umsukoas/screen/nilai/components/stickyGlobalRate.dart';
import 'package:umsukoas/screen/nilai/components/stickyHasil.dart';

import '../../../config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<DropdownMenuItem<String>> itemsStase = [];
  String selectedValueStase;
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    initRaport();
    super.initState();
  }

  Future<void> initRaport() async {
    itemsStase.clear();
    apiService.getStaseNilai(Config.npm).then((value) {
      for (var i = 0; i < value.length; i++) {
        itemsStase.add(DropdownMenuItem(
          child: Text(
            value[i].staseNama.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          value: value[i].staseId,
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
                hintText: "Pilih Stase",
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
              value: selectedValueStase,
              onChanged: (String newValue) {
                setState(() {
                  selectedValueStase = newValue;
                  print(selectedValueStase);
                });
              },
              items: itemsStase,
            ),
            Divider(),
            FutureBuilder(
              future: apiService.getMyNilai(Config.npm, selectedValueStase),
              builder: (
                BuildContext context,
                AsyncSnapshot<MyNilai> model,
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

Widget _buildMyNilai(MyNilai myNilai) {
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
                  return Sticky(
                    kegiatan: myNilai.data[index].kegiatan,
                    bobot: myNilai.data[index].bobot,
                    nilai: myNilai.data[index].nilai,
                    hasil: myNilai.data[index].hasil,
                  );
                },
              ),
            ),
            StickyHasil(
              kegiatan: 'Nilai Akhir',
              nilai: myNilai.nilaiAkhir,
              nilaiangka: myNilai.nilaiHuruf,
            ),
            StickyGlobalRate(
              kegiatan: 'Kondite',
              hasil: myNilai.kondite,
              sanksi: myNilai.sanksi,
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
