import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('asset/lotties/maintenance.json',
          width: getProportionateScreenWidth(225)),
    );
  }
}
