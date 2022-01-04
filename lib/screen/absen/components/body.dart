import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/components/buttonCircle.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/config.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/models/model_myjadwal.dart';
import 'package:umsukoas/restapi/api_services.dart';
import '../../../size_config.dart';
import 'absenHeader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbsenHeader(),
        FutureBuilder(
          future: apiService.getMyJadwal(Config.npm),
          builder: (
            BuildContext context,
            AsyncSnapshot<MyJadwal> model,
          ) {
            if (model.hasData) {
              return _buildJadwalList(model.data);
            }

            return Container(
              height: 350,
              child: LodingWidget(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildJadwalList(MyJadwal jadwals) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: Container(
        child: jadwals.status
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: jadwals.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return dayTask(
                    jadwals.data[index].staseNama,
                    jadwals.data[index].rumahSakitNama,
                    jadwals.data[index].rumahSakitTelp,
                    jadwals.data[index].rumahSakitAlamat == null
                        ? "-"
                        : jadwals.data[index].rumahSakitAlamat,
                  );
                },
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
              ),
      ),
    );
  }

  Row dayTask(String unit, String name, String handphone, String alamat) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(20),
            color: Color(0xffdfdeff),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(250),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Handphone :',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  handphone,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Alamat :",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(250),
                      child: Text(
                        alamat,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    ButtonCircle(
                      press: () {
                        final progress = ProgressHUD.of(context);
                        progress?.showWithText('Proses Absen Masuk');
                        Future.delayed(Duration(seconds: 1), () {
                          //do your magic;
                          progress?.dismiss();
                        });
                      },
                      icon: Icon(
                        MdiIcons.login,
                        color: Colors.white,
                        size: 18,
                      ),
                      color: Colors.white,
                      bgcolor: kPrimaryColor,
                      text: Text(
                        "Masuk",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ButtonCircle(
                      press: () {
                        final progress = ProgressHUD.of(context);
                        progress?.showWithText('Proses Absen Pulang');
                        Future.delayed(Duration(seconds: 1), () {
                          //do your magic;
                          progress?.dismiss();
                        });
                      },
                      icon: Icon(
                        MdiIcons.logout,
                        color: Colors.white,
                        size: 18,
                      ),
                      color: Colors.white,
                      bgcolor: kPrimaryColor,
                      text: Text(
                        "Pulang",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      unit,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
