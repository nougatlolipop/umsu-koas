import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'components/body.dart';

class FollowUpScreen extends StatelessWidget {
  static String routeName = '/followupScreen';
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(child: Body());
  }
}
