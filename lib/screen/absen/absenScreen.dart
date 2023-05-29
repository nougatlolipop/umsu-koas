import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'components/body.dart';

class AbsenScreen extends StatelessWidget {
  static String routeName = "/absenScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        title: "Kehadiran",
        border: false,
        action: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/dataHadirScreen");
                },
                icon: Icon(MdiIcons.viewList),
              ),
              Container(
                width: 10,
              )
            ],
          ),
        ],
      ),
      body: ProgressHUD(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Body(),
          ],
        ),
      )),
    );
  }
}
