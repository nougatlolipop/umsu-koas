import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class LogBookScreen extends StatelessWidget {
  static String routeName = '/logbookScreen';

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(child: Body());
  }
}
