import 'package:flutter/widgets.dart';
import 'screen/home/homeScreen.dart';
import 'screen/welcome/welcomePage.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
};
