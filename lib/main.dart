import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
  void _checkVersion(BuildContext context) {
    try {
      NewVersion(
        iOSId: 'com.umsu.koas',
        androidId: 'com.umsu.koas',
      ).showAlertIfNecessary(context: context);
    } catch (e) {
      debugPrint("error=>>>>${e.toString()}");
    }
  }

  void _getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    Config.appName = packageInfo.appName;
    Config.packageName = packageInfo.packageName;
    Config.version = packageInfo.version;
    Config.buildNumber = packageInfo.buildNumber;
  }

  @override
  void initState() {
    super.initState();
    _getPackageInfo();
    _checkVersion(context);
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
