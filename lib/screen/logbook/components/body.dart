import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/components/myAppBar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Log Book",
        action: <Widget>[
          IconButton(
            icon: Icon(
              MdiIcons.contentSave,
              color: Colors.white,
            ),
            onPressed: () {
              print(jsonEncode(_controller.document.toDelta().toJson()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false, // true for view only mode
                ),
              ),
            ),
            QuillToolbar.basic(controller: _controller),
          ],
        ),
      ),
    );
  }
}
