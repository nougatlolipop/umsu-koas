import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'body.dart';

class EvaluasiDosenScreen extends StatelessWidget {
  static String routeName = '/evaluasi';
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
