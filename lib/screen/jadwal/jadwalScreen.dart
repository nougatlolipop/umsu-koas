import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';

import 'components/body.dart';

class JadwalScreen extends StatelessWidget {
  static String routeName = '/jadwalScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Jadwal"),
      ),
      body: Body(),
    );
  }
}
