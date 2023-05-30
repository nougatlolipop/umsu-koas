import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/constants.dart';

class ListPanduan extends StatelessWidget {
  ListPanduan({this.press, this.fileNama});
  String fileNama;
  Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                MdiIcons.fileSettingsOutline,
                color: Colors.white,
                size: 45,
              ),
              Text(
                fileNama,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
