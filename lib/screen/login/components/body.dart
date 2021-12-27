import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:umsukoas/screen/home/homeScreen.dart';

const users = const {
  'mrivan@umsu.ac.id': 'allahuakbar1213',
  'fikri.mfa@gmail.com': 'qwerty123',
};

class Body extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'KOAS UMSU',
      logo: AssetImage('asset/images/logoumsu.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
