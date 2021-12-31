import 'package:flutter/material.dart';
import 'absenHeader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbsenHeader(),
        // SizedBox(
        //   height: getProportionateScreenHeight(55),
        // ),
      ],
    );
  }
}
