import 'package:flutter/material.dart';
import 'package:umsukoas/constants.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    Key key,
    Widget title,
  }) : super(
          key: key,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: title,
          actions: [],
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: kPrimaryColor,
            ),
          ),
        );
}
