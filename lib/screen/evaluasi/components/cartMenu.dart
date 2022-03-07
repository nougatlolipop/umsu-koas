import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/size_config.dart';

class CardMenu extends StatelessWidget {
  final String text;
  final String icon;
  final String desc;
  final Function press;

  CardMenu({this.text, this.press, this.icon, this.desc});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    MdiIcons.fromString(icon),
                    color: Colors.white,
                    size: getProportionateScreenWidth(50),
                  ),
                  SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                desc,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Klik Disini',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                  Icon(
                    MdiIcons.fromString('chevron-right'),
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
