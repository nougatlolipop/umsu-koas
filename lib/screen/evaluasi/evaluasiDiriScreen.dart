import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/screen/evaluasi/componentsDiri/body.dart';

class EvaluasiDiriScreen extends StatelessWidget {
  static String routeName = '/refleksi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Refleksi Diri",
      ),
      body: Body(),
    );
  }
}
