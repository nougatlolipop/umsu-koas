import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/models/model_mydoping.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../config.dart';
import '../../../size_config.dart';

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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                color: Colors.amber,
                height: getProportionateScreenHeight(60),
                child: Text(
                  'Silahkan Pilih Dosen Yang Akan Diberikan Evaluasi, Dengan Klik Card (kartu) dibawah ini !!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            FutureBuilder(
              future: apiService.getMyDopingEvaluasi(Config.npm),
              builder: (
                BuildContext context,
                AsyncSnapshot<MyDoping> model,
              ) {
                if (model.hasData) {
                  return _buildDopingList(model.data);
                }
                return Container(
                  height: SizeConfig.screenHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LodingWidget(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDopingList(MyDoping dopings) {
    return dopings.status
        ? Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(8.0)),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dopings.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCreditCard(
                  color: kPrimaryColor,
                  dopingEmail: dopings.data[index].dopingEmail,
                  cardNumber: dopings.data[index].dopingNamaLengkap,
                  cardHolder: dopings.data[index].rumahSakitShortname,
                );
              },
            ),
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
                  dopings.message,
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          );
  }

  // Build the credit card widget
  GestureDetector _buildCreditCard({
    @required Color color,
    @required String cardNumber,
    @required String cardHolder,
    @required String dopingEmail,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(
          context, '/evaluasiDosenScreen',
          arguments: ParamString(dopingEmail, cardNumber)),
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          height: 200,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLogosBlock(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  '$cardNumber',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'CourrierPrime'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildDetailsBlock(
                    label: 'HOMEBASE',
                    value: cardHolder,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "asset/images/logoumsu.png",
          height: 35,
          width: 35,
        ),
        Container(
          height: 50,
          width: 50,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({@required String label, @required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class ParamString {
  final String dopingEmail, namaDosen;
  ParamString(this.dopingEmail, this.namaDosen);
}
