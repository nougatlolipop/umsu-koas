import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'announcement.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Container(
          height: getProportionateScreenHeight(315),
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
                "Assalamualaikum wr. wb., Selamat Sore Sukrianto irvan fikri ansari atika umaya",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: getProportionateScreenWidth(-40),
          child: Announcement(),
        )
      ],
    );
  }
}
