import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';

import 'components/body.dart';

class BeritaScreen extends StatelessWidget {
  static String routeName = '/beritaScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Berita",
      ),
      body: Body(),
    );
  }
}
