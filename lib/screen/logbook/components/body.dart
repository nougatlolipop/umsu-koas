import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:umsukoas/components/myAppBar.dart';

import 'listKegiatan.dart';
import 'tambahKegiatan.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Kegiatan",
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              new Tab(
                text: "Kegiatan Saya",
              ),
              new Tab(
                text: "Tambah Kegiatan",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            ListKegiatan(),
            TambahKegiatan(),
          ],
        ));
  }

  RenderBox _findBorderBox(RenderBox box) {
    RenderBox borderBox;

    box.visitChildren((child) {
      if (child is RenderCustomPaint) {
        borderBox = child;
      }

      final box = _findBorderBox(child as RenderBox);
      if (box != null) {
        borderBox = box;
      }
    });

    return borderBox;
  }
}
