import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:umsukoas/components/defaultButton.dart';

import '../../../constants.dart';

class CardAbsensi extends StatelessWidget {
  const CardAbsensi({
    Key key,
    this.tanggal,
    this.alamat,
    this.keterangan,
  }) : super(key: key);
  final String tanggal;
  final String alamat;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.green, width: 5)),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    iconColor: kPrimaryColor,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "${tanggal}",
                        style: TextStyle(fontSize: 18),
                      )),
                  collapsed: Text(
                    "Absensi : ${keterangan}",
                    softWrap: true,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lokasi Absen : ${alamat}",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
