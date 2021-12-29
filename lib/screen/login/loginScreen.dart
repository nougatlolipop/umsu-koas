import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/loginScreen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Body();
  }
}
