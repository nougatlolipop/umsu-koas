import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class RekamMedisScreen extends StatelessWidget {
  static String routeName = '/rekammedisScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Rekam Medis"),
      ),
      body: Body(),
    );
  }
}
