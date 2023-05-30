import 'package:flutter/material.dart';
import 'package:umsukoas/components/input_container.dart';
import '../constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput(
      {Key key, @required this.icon, @required this.hint, this.name})
      : super(key: key);

  final IconData icon;
  final String hint;
  final name;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: name,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
