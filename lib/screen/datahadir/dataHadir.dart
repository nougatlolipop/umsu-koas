import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';

import 'components/Body.dart';

class DataHadir extends StatelessWidget {
  static String routeName = '/dataHadirScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Data Hadir',
      ),
      body: Body(),
    );
  }
}
