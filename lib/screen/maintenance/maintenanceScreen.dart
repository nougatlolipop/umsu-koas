import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';

import 'components/body.dart';

class MaintenanceScreen extends StatelessWidget {
  static String routeName = '/maintenanceScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Maintenance",
      ),
      body: Body(),
    );
  }
}
