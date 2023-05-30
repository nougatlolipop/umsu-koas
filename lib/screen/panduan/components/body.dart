import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/config.dart';
import 'package:umsukoas/models/model_panduan.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'listPanduan.dart';

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: apiService.getPanduan(),
              builder: (
                BuildContext context,
                AsyncSnapshot<Panduan> model,
              ) {
                if (model.hasData) {
                  return _buildPanduanList(model.data);
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

Widget _buildPanduanList(Panduan panduan) {
  return panduan.status
      ? Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: panduan.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListPanduan(
                fileNama: panduan.data[index].panduanNama,
                press: () {
                  Navigator.pushNamed(
                    context,
                    '/lihatPanduanScreen',
                    arguments: ParamString(panduan.data[index].panduanFile),
                  );
                },
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

class ParamString {
  final String filePdf;
  ParamString(this.filePdf);
}
