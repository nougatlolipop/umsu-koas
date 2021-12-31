import 'package:flutter/material.dart';
import 'package:umsukoas/constants.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    Key key,
    Widget title,
    List<Widget> action,
    bool border = true,
  }) : super(
          key: key,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: title,
          actions: action,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: border
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))
                  : null,
              color: kPrimaryColor,
            ),
          ),
        );
}
