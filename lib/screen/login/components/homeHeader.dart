import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'formLogin.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Container(
          height:
              getProportionateScreenHeight((SizeConfig.screenHeight / 2) + 50),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('asset/images/logoumsu.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            Text(
              "Login",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(73),
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 0.5,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              "Silahkan Login Menggunakan Credential Portal UMSU",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: getProportionateScreenWidth(-80),
          child: FormLogin(),
        )
      ],
    );
  }
}
