import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/constants.dart';

import '../../../size_config.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(313),
      height: getProportionateScreenWidth(150),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.16),
            spreadRadius: -2,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Npm',
                border: InputBorder.none,
                prefixIcon: Icon(MdiIcons.accountOutline),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
                prefixIcon: Icon(MdiIcons.lockOutline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
