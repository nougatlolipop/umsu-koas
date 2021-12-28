import 'package:flutter/material.dart';
import '../../../components/sectionTile.dart';
import 'homeHeader.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(),
          SizedBox(height: getProportionateScreenHeight(60)),
          SectionTile(
            title: "Menu Utama",
            press: () {},
          ),
        ],
      ),
    );
  }
}
