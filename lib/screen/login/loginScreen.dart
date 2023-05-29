import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../size_config.dart';
import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/loginScreen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ProgressHUD(child: Body());
  }
}
