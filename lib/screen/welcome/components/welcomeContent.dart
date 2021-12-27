import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/constants.dart';
import '../../../size_config.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    Key key,
    this.title,
    this.image,
    this.deskripsi,
    this.penjelasan,
  }) : super(key: key);
  final String title, deskripsi, image, penjelasan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          deskripsi,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Lottie.asset(
          image,
          width: getProportionateScreenWidth(235),
        ),
        Spacer(),
        Text(
          penjelasan,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
