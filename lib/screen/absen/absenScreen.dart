import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class AbsenScreen extends StatelessWidget {
  static String routeName = "/absenScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Kehadiran"),
        border: false,
      ),
      body: Body(),
    );
  }
}
