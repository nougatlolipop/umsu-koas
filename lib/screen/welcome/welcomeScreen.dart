import 'package:flutter/material.dart';
import 'package:umsukoas/screen/home/homeScreen.dart';
import 'package:umsukoas/services/shared_service.dart';
import 'package:umsukoas/size_config.dart';
import 'components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcomeScreen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new FutureBuilder(
      future: SharedService.isLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> loginModel) {
        if (loginModel.hasData) {
          if (loginModel.data) {
            return HomeScreen();
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //     '/dashboard', (Route<dynamic> route) => false);
          } else {
            return Scaffold(
              body: Body(),
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
