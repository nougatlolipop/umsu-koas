import 'package:flutter/material.dart';
import 'package:umsukoas/components/defaultButton.dart';
import '../../../size_config.dart';
import '../components/homeHeader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeHeader(),
          SizedBox(height: getProportionateScreenHeight(120)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: DefaultButton(
              text: "Login",
              press: () {
                Navigator.pushNamed(context, "/homeScreen");
              },
            ),
          ),
        ],
      ),
    );
  }
}
