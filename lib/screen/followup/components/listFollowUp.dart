import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_followup.dart';
import 'package:umsukoas/models/model_mylogbook.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'cardFollowUp.dart';

class ListFollowUp extends StatefulWidget {
  @override
  _ListFollowUpState createState() => _ListFollowUpState();
}

class _ListFollowUpState extends State<ListFollowUp> {
  APIService apiService;

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
              future: apiService.getFollowUp(Config.npm),
              builder: (
                BuildContext context,
                AsyncSnapshot<FollowUp> model,
              ) {
                if (model.hasData) {
                  return _buildFollowUpList(model.data);
                }
                return Container(
                  height: 350,
                  child: LodingWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowUpList(FollowUp mylogbook) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8.0)),
      child: Container(
        child: mylogbook.status
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: mylogbook.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardFollowUp(
                    deskripsi: mylogbook.data[index].followUpKasusSOAP,
                    rumahSakit: mylogbook.data[index].rumahSakitShortname,
                    staseNama: mylogbook.data[index].staseNama,
                    namaDoping: mylogbook.data[index].dopingNamaLengkap,
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
}
