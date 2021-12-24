import 'package:flutter/material.dart';
import 'package:umsukoas/size_config.dart';
import 'components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcomeScreen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
