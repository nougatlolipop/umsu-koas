import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMSU Work',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'ubuntu',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcomeScreen',
      routes: routes,
    );
  }
}

