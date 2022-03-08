import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/size_config.dart';

class CardKehadiran extends StatelessWidget {
  CardKehadiran({
    this.keterangan,
    this.alamat,
    this.latlong,
  });
  String keterangan;
  String alamat;
  String latlong;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              keterangan == "masuk" ? MdiIcons.login : MdiIcons.logout,
              color: Colors.white,
              size: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${keterangan.toUpperCase()}',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 5),
                Container(
                  width: getProportionateScreenWidth(270),
                  child: Text(
                    '${alamat}',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ),
                Text(
                  latlong,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
