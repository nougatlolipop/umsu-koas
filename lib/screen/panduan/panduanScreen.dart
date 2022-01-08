import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class PanduanScreen extends StatelessWidget {
  static String routeName = '/panduanScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Panduan Profesi",
      ),
      body: Body(),
    );
  }
}
