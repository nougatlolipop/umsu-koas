import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';

import 'maintenance/body.dart';

class MaintenanceScreen extends StatelessWidget {
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
