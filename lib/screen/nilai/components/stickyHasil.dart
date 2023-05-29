import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../constants.dart';

class StickyHasil extends StatelessWidget {
  const StickyHasil({
    Key key,
    this.nilai,
    this.nilaiangka,
    this.kegiatan,
  }) : super(key: key);
  final String nilai, kegiatan, nilaiangka;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          )
        ],
      ),
      margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 40,
            color: kSuccessColor,
            child: Text(
              kegiatan,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        new TextSpan(
                          text: nilai,
                          style: new TextStyle(
                            fontSize: 25,
                            color: kSuccessColor,
                          ),
                        ),
                        new TextSpan(
                          text: ' /',
                          style: new TextStyle(
                            fontSize: 25,
                            color: kSuccessColor,
                          ),
                        ),
                        new TextSpan(
                          text: ' ${nilaiangka}',
                          style: new TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kSuccessColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
