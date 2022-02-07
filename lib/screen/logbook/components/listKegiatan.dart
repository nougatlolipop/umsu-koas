import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_mylogbook.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'cardKegiatan.dart';

class ListKegiatan extends StatefulWidget {
  @override
  _ListKegiatanState createState() => _ListKegiatanState();
}

class _ListKegiatanState extends State<ListKegiatan> {
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
              future: apiService.getMyLogbook(Config.npm),
              builder: (
                BuildContext context,
                AsyncSnapshot<MyLogbook> model,
              ) {
                if (model.hasData) {
                  return _buildMyLogbookList(model.data);
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

  Widget _buildMyLogbookList(MyLogbook mylogbook) {
    return mylogbook.status
        ? Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: mylogbook.data.length,
              itemBuilder: (BuildContext context, int index) {
                return CardKegiatan(
                  kegiatan: mylogbook.data[index].kegiatanNama,
                  juduldeskripsi: mylogbook.data[index].logbookJudulDeskripsi,
                  deskripsi: mylogbook.data[index].logbookDeskripsi,
                  rumahSakit: mylogbook.data[index].rumahSakitShortname,
                  staseNama: mylogbook.data[index].staseNama,
                  namaDoping: mylogbook.data[index].dopingNamaLengkap,
                  tanggal: formatter.format(
                    DateTime.fromMillisecondsSinceEpoch(
                            int.parse(mylogbook.data[index].logbookTanggal))
                        .toUtc(),
                  ),
                  verify: mylogbook.data[index].logbookIsVerify == "1"
                      ? true
                      : false,
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
