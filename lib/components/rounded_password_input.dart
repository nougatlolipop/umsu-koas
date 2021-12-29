import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constants.dart';
import 'input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key key, @required this.hint, this.name})
      : super(key: key);

  final String hint;
  final name;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: name,
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(
            MdiIcons.lockOutline,
            color: kPrimaryColor,
          ),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
