import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umsukoas/models/model_login.dart';
import 'package:umsukoas/restapi/api_services.dart';
import 'package:umsukoas/services/shared_service.dart';
import 'package:umsukoas/size_config.dart';
import '../../../config.dart';
import 'homeHeader.dart';
import 'menuGrid.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  APIService apiService;
  LoginModel loginModel;

  @override
  void initState() {
    apiService = new APIService();
    loginModel = new LoginModel();
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    loginModel =
        LoginModel.fromJson(jsonDecode(prefs.getString("login_details")));
    print(loginModel.data[0].npm);
    apiService.createUser(loginModel.data[0].npm, Config.playerId);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(),
          SizedBox(
            height: getProportionateScreenHeight(55),
          ),
          MenuGrid(),
        ],
      ),
    );
  }
}
