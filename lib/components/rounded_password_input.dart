import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constants.dart';
import 'input_container.dart';

class RoundedPasswordInput extends StatefulWidget {
  const RoundedPasswordInput({Key key, @required this.hint, this.name})
      : super(key: key);

  final String hint;
  final name;

  @override
  State<RoundedPasswordInput> createState() => _RoundedPasswordInputState();
}

class _RoundedPasswordInputState extends State<RoundedPasswordInput> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: widget.name,
      cursorColor: kPrimaryColor,
      obscureText: _isObscure,
      decoration: InputDecoration(
        icon: Icon(
          MdiIcons.lockOutline,
          color: kPrimaryColor,
        ),
        hintText: widget.hint,
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(
            _isObscure ? MdiIcons.eyeOutline : MdiIcons.eyeOffOutline,
            color: kPrimaryColor,
          ),
        ),
      ),
    ));
  }
}
