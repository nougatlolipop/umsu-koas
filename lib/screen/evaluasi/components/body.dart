import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_myEvaluasi.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'cartMenu.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
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
    return Center(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: apiService.getMyEvaluasi(Config.npm),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<MyEvaluasi> model,
                ) {
                  if (model.hasData) {
                    return _buildMyEvaluasiList(model.data);
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
      ),
    );
  }

  Widget _buildMyEvaluasiList(MyEvaluasi myEvaluasi) {
    return myEvaluasi.status
        ? Container(
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: myEvaluasi.data.length,
              itemBuilder: (BuildContext context, int index) => Menu(
                  myEvaluasi.data[index].available,
                  myEvaluasi.data[index].text,
                  myEvaluasi.data[index].icon,
                  myEvaluasi.data[index].press,
                  myEvaluasi.data[index].desc,
                  context),
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
                myEvaluasi.message,
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              )
            ],
          );
  }

  Widget Menu(bool avail, String text, String icon, String press, String desc,
      BuildContext context) {
    if (avail) {
      return CardMenu(
        text: text,
        icon: icon,
        desc: desc,
        press: () {
          Navigator.pushReplacementNamed(context, press);
        },
      );
    } else {
      return Container();
    }
  }
}
