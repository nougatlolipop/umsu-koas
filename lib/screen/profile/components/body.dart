import 'package:flutter/material.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/size_config.dart';

import 'info.dart';
import 'profileMenuItem.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "asset/images/logoumsu.png",
            name: "Jhon Doe",
            email: "Jhondoe01@gmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), //20
          ProfileMenuItem(
            iconSrc: "",
            title: "Saved Recipes",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "",
            title: "Super Plan",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "",
            title: "Change Language",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "",
            title: "Help",
            press: () {},
          ),
        ],
      ),
    );
  }
}
