import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umsukoas/config.dart';
import 'constants.dart';
import 'routes.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.init(Config.oneSignalKey, iOSSettings: null);
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      this.setState(() {});
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print("notifikasi di tap");
      Navigator.pushNamed(context, "/notifikasi");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOAS UMSU',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcomeScreen',
      routes: routes,
    );
  }
}
