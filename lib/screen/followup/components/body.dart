import 'package:flutter/material.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/screen/followup/components/listFollowUp.dart';
import 'package:umsukoas/screen/followup/components/tambahFollowUp.dart';

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
          title: "Follow Up",
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              new Tab(
                text: "Data Follow Up",
              ),
              new Tab(
                text: "Tambah Follow Up",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            ListFollowUp(),
            TambahFollowUp(),
          ],
        ));
  }
}
