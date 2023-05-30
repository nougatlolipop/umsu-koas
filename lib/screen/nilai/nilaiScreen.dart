import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class NilaiScreen extends StatelessWidget {
  static String routeName = '/nilaiScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Nilai",
      ),
      body: Body(),
    );
  }
}
