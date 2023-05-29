import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';

import 'components/body.dart';

class EvaluasiScreen extends StatelessWidget {
  static String routeName = '/evaluasiScreen';
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
