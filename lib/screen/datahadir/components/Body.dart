import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_kehadiran.dart';
import 'package:umsukoas/restapi/api_services.dart';
import 'package:umsukoas/screen/datahadir/components/cardKehadiran.dart';

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
              future: apiService.getKehadiran(Config.npm),
              builder: (
                BuildContext context,
                AsyncSnapshot<Kehadiran> model,
              ) {
                if (model.hasData) {
                  return _buildMyKehadiranList(model.data);
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

  Widget _buildMyKehadiranList(Kehadiran kehadiran) {
    return kehadiran.status
        ? Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: kehadiran.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CardKehadiran(
                  keterangan: kehadiran.data[index].absensiKeterangan,
                  alamat: kehadiran.data[index].absensiLokasi,
                  latlong: kehadiran.data[index].absensiLatLong,
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
