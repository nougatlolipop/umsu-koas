import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'announcement.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 10) {
    return 'Pagi';
  }
  if (hour < 14) {
    return 'Siang';
  }
  if (hour < 18) {
    return 'Siang';
  }
  return 'Malam';
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Container(
          height: getProportionateScreenHeight(350),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(80)),
              Text(
                "KOAS UMSU",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(55),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 0.5,
                ),
              ),
              Text(
                "Assalamualaikum wr. wb., Selamat ${greeting()} Sukrianto irvan fikri ansari atika umaya",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: getProportionateScreenWidth(-50),
          child: Announcement(),
        )
      ],
    );
  }
}
