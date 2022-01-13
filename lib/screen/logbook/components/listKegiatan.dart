import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
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

  Widget _buildMyLogbookList(MyLogbook mylogbook) {
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
                  return CardKegiatan(
                    kegiatan: mylogbook.data[index].kegiatanNama,
                    juduldeskripsi: mylogbook.data[index].logbookJudulDeskripsi,
                    deskripsi: mylogbook.data[index].logbookDeskripsi,
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
