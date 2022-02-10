import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:umsukoas/components/defaultButton.dart';

import '../../../constants.dart';

class CardFollowUp extends StatelessWidget {
  const CardFollowUp({
    Key key,
    this.deskripsi,
    this.rumahSakit,
    this.staseNama,
    this.namaDoping,
    this.tanggal,
    this.verify,
  }) : super(key: key);
  final String deskripsi;
  final String rumahSakit;
  final String staseNama;
  final String namaDoping;
  final String tanggal;
  final bool verify;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: verify ? Colors.green : Colors.red, width: 5)),
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
                        "${rumahSakit}",
                        style: TextStyle(fontSize: 18),
                      )),
                  collapsed: Text(
                    "${tanggal}\n${staseNama}\nPembimbing : ${namaDoping}",
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Html(data: deskripsi),
                      Divider(),
                      DefaultButton(
                        text: "Edit",
                        color: Colors.white,
                        background: kPrimaryColor,
                        press: () {},
                      )
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