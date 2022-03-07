import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umsukoas/config.dart';
import 'constants.dart';
import 'routes.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setAppId(Config.oneSignalKey);
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

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
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print("notifikasi di terima");
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print("notifikasi di tap");
    });
    getuserOneSignal();
  }

  Future<void> getuserOneSignal() async {
    var status = await OneSignal.shared.getDeviceState();
    String onesignalUserId = status.userId;
    Config.playerId = onesignalUserId;
    print(status.userId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dr. Muda UMSU',
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
