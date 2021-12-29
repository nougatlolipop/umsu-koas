import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_login.dart';
import 'package:umsukoas/services/shared_service.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'announcement.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 10) {
    return 'Pagi';
  }
  if (hour < 14) {
    return 'Siang';
  }
  if (hour < 18) {
    return 'Siang';
  }
  return 'Malam';
}

class _HomeHeaderState extends State<HomeHeader> {
  LoginModel loginModel;
  String nama;
  @override
  void initState() {
    getUserLogin();
    super.initState();
  }

  Future<void> getUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("login_details");

    loginModel =
        LoginModel.fromJson(jsonDecode(prefs.getString("login_details")));
    setState(() {
      nama = loginModel.data[0].fullname;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Container(
          height: getProportionateScreenHeight(370),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: new DecorationImage(
              image: ExactAssetImage('asset/images/circle.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          right: getProportionateScreenWidth(10),
          top: getProportionateScreenHeight(35),
          child: IconButton(
            icon: Icon(
              MdiIcons.accountCircleOutline,
            ),
            iconSize: 35,
            color: Colors.white,
            splashColor: Colors.purple,
            onPressed: () {
              Navigator.pushNamed(context, '/profileScreen');
            },
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(45),
          left: getProportionateScreenWidth(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(180)),
              Text(
                "KOAS UMSU",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(35),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 0.5,
                ),
              ),
              Text(
                "Assalamualaikum wr. wb., Selamat ${greeting()} \n${nama}",
                style: TextStyle(
                  color: Colors.white,
                ),
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: getProportionateScreenWidth(-60),
          child: Announcement(),
        )
      ],
    );
  }
}
