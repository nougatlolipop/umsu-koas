import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/screen/evaluasi/componentsDosen/body.dart';

class FormEvaluasiDosenScreen extends StatelessWidget {
  static String routeName = '/evaluasiDosenScreen';
  String namaDosen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Evaluasi",
      ),
      body: Body(),
    );
  }
}
