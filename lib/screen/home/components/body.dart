import 'package:flutter/material.dart';
import 'package:umsukoas/size_config.dart';
import 'homeHeader.dart';
import 'menuGrid.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(),
        SizedBox(
          height: getProportionateScreenHeight(55),
        ),
        MenuGrid(),
      ],
    );
  }
}
