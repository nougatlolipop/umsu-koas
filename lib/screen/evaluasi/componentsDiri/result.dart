import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/constants.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    String resultText;
    resultText = 'Terima Kasih, Sudah Berpartisipasi!!';
    print(resultScore);
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('asset/lotties/quisioner.json'),
          Text(
            resultPhrase,
            style: TextStyle(color: kPrimaryColor),
            textAlign: TextAlign.center,
          ), //Text
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
