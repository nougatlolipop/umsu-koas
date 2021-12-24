import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text(
                  "UMSU KOAS",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                Text(
                  "UMSU KOAS",
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
