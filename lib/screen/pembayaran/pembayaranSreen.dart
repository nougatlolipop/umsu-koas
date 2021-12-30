import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class PembayaranScreen extends StatelessWidget {
  static String routeName = '/pembayaranScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Pembayaran"),
      ),
      body: Body(),
    );
  }
}
