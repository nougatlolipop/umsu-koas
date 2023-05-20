import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';

import 'components/body.dart';

class PimScreen extends StatelessWidget {
  static String routeName = '/pimScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
