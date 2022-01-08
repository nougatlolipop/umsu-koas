import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class AbsenScreen extends StatelessWidget {
  static String routeName = "/absenScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        title: "Kehadiran",
        border: false,
      ),
      body: ProgressHUD(child: Body()),
    );
  }
}
