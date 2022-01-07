import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notus_to_html_to_notus/notus_to_html_to_notus.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:zefyrka/zefyrka.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ZefyrController _controller = ZefyrController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Log Book"),
      ),
      body: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        child: Column(
          children: [
            ZefyrToolbar.basic(controller: _controller),
            Expanded(
              child: ZefyrEditor(
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(jsonEncode(_controller.document));
        },
        child: Icon(MdiIcons.contentSave),
      ),
    );
  }
}
