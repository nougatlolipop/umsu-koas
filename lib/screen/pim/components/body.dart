import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/screen/pim/components/tambahPIM.dart';
import 'package:umsukoas/screen/pim/components/nilaiPim.dart';

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
          title: "PIM",
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              new Tab(
                text: "Kegiatan",
              ),
              new Tab(
                text: "Nilai",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            TambahPIM(),
            NilaiPim(),
          ],
        ));
  }
}
