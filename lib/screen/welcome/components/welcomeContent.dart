import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/constants.dart';
import '../../../size_config.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    Key key,
    this.title,
    this.image,
  }) : super(key: key);
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "KOAS UMSU",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Lottie.asset(
          image,
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
