import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class LogBookScreen extends StatelessWidget {
  static String routeName = '/logbookScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Log Book"),
      ),
      body: Body(),
    );
  }
}
