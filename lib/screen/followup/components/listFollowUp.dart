import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_followup.dart';
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
  var formatter = new DateFormat('yyyy-MM-dd');
  ScrollController _controller = new ScrollController();

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

  Widget _buildFollowUpList(FollowUp mylogbook) {
    return mylogbook.status
        ? Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: mylogbook.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CardFollowUp(
                  deskripsi: mylogbook.data[index].followUpKasusSOAP,
                  rumahSakit: mylogbook.data[index].rumahSakitShortname,
                  staseNama: mylogbook.data[index].staseNama,
                  namaDoping: mylogbook.data[index].dopingNamaLengkap,
                  tanggal: formatter.format(
                    DateTime.fromMillisecondsSinceEpoch(
                            int.parse(mylogbook.data[index].followUpTglPeriksa))
                        .toUtc(),
                  ),
                );
              },
            ),
          )
        : Container(
            height: SizeConfig.screenHeight,
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
                  "Tidak ada jadwal kegiatan",
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          );
  }
}
