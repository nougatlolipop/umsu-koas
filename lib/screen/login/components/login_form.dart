import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umsukoas/components/rounded_button.dart';
import 'package:umsukoas/components/rounded_input.dart';
import 'package:umsukoas/components/rounded_password_input.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/size_config.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: kTextColorHome,
                  ),
                ),
                SizedBox(height: 40),
                Lottie.asset('asset/lotties/absen.json',
                    width: getProportionateScreenWidth(235)),
                SizedBox(height: 40),
                RoundedInput(icon: Icons.mail, hint: 'Username'),
                RoundedPasswordInput(hint: 'Password'),
                SizedBox(height: 10),
                RoundedButton(title: 'LOGIN'),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
