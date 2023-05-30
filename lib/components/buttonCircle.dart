import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  const ButtonCircle({
    Key key,
    this.press,
    this.icon,
    this.color,
    this.bgcolor,
    this.text,
  }) : super(key: key);
  final Function press;
  final Widget icon;
  final Color color;
  final Color bgcolor;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(40, 40),
      child: ClipOval(
        child: Material(
          color: bgcolor,
          child: InkWell(
            splashColor: color,
            onTap: press,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                text,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
