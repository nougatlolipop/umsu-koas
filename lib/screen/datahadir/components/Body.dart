import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_myabsensi.dart';
import 'package:umsukoas/restapi/api_services.dart';
import 'package:umsukoas/screen/datahadir/components/cardAbsensi.dart';

import '../../../config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  APIService apiService;
  var formatter = new DateFormat('dd-MM-yyyy');

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: apiService.getMyAbsensi(Config.npm),
              builder: (
                BuildContext context,
                AsyncSnapshot<MyAbsensi> model,
              ) {
                if (model.hasData) {
                  return _buildMyAbsensiList(model.data);
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

  Widget _buildMyAbsensiList(MyAbsensi myabsensi) {
    return myabsensi.status
        ? Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: myabsensi.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CardAbsensi(
                  alamat: myabsensi.data[index].absensiLokasi,
                  keterangan: myabsensi.data[index].absensiKeterangan,
                  tanggal: formatter.format(
                    DateTime.fromMillisecondsSinceEpoch(
                            int.parse(myabsensi.data[index].absensiTanggal))
                        .toUtc(),
                  ),
                );
              },
            ),
          )
        : Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(100)),
              Container(
                child: Lottie.asset(
                  'asset/lotties/relax.json',
                  width: 250,
                ),
              ),
              Text(
                "Tidak ada jadwal kegiatan",
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              )
            ],
          );
  }
}
