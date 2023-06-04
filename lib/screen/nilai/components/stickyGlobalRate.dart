import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../constants.dart';

class StickyGlobalRate extends StatelessWidget {
  const StickyGlobalRate({
    Key key,
    this.hasil,
    this.sanksi,
    this.kegiatan,
  }) : super(key: key);
  final String hasil, kegiatan, sanksi;

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
                  child: (int.parse(hasil) == 0)
                      ? Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              new TextSpan(
                                text: 'Sufficient',
                                style: new TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              new TextSpan(
                                text: ' /',
                              ),
                              new TextSpan(
                                text: ' Unsufficient',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      : (int.parse(hasil) == 1)
                          ? Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: 'Sufficient',
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  new TextSpan(
                                    text: ' /',
                                  ),
                                  new TextSpan(
                                    text: ' Unsufficient',
                                    style: new TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                ),
              ],
            ),
          ),
          (int.parse(hasil) != 2)
              ? Container(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  width: double.infinity,
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ReadMoreText(
                      "Sanksi :\n\n${sanksi}",
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      style:
                          TextStyle(color: kSuccessColor, fontFamily: 'mulish'),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
