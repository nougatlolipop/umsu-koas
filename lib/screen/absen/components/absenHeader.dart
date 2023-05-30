import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umsukoas/models/model_login.dart';
import 'jamAbsen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class AbsenHeader extends StatefulWidget {
  @override
  State<AbsenHeader> createState() => _AbsenHeaderState();
}

class _AbsenHeaderState extends State<AbsenHeader> {
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
          height: getProportionateScreenHeight(270),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: new DecorationImage(
              image: ExactAssetImage('asset/images/circle2.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: getProportionateScreenWidth(-45),
          child: JamAbsen(),
        )
      ],
    );
  }
}
