import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Text(
                    "KOAS UMSU",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Dengan bangga mempersembahkan KOAS UMSU",
                  ),
                  Lottie.asset("assets/lotties/"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
