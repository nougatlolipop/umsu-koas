import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class PembimbingScreen extends StatelessWidget {
  static String routeName = '/pembimbingScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Pembimbing",
      ),
      body: Body(),
    );
  }
}
