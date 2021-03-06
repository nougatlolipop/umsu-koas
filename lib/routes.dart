import 'package:flutter/widgets.dart';
import 'screen/login/loginScreen.dart';
import 'screen/home/homeScreen.dart';
import 'screen/welcome/welcomeScreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};
