import 'package:flutter/widgets.dart';
import 'screen/datahadir/dataHadir.dart';
import 'screen/followup/followupScreen.dart';
import 'screen/pembimbing/pembimbingScreen.dart';
import 'screen/evaluasi/evaluasiDiriScreen.dart';
import 'screen/evaluasi/evaluasiDosenScreen.dart';
import 'screen/evaluasi/evaluasiScreen.dart';
import 'screen/absen/absenScreen.dart';
import 'screen/evaluasi/formEvaluasiDosenSceen.dart';
import 'screen/jadwal/jadwalScreen.dart';
import 'screen/logbook/logbookScreen.dart';
import 'screen/nilai/nilaiScreen.dart';
import 'screen/panduan/components/lihatPanduan.dart';
import 'screen/panduan/components/lihatPanduanApp.dart';
import 'screen/panduan/panduanScreen.dart';
import 'screen/profile/profileScreen.dart';
import 'screen/berita/beritaScreen.dart';
import 'screen/login/loginScreen.dart';
import 'screen/home/homeScreen.dart';
import 'screen/welcome/welcomeScreen.dart';
import 'screen/maintenance/maintenanceScreen.dart';
<<<<<<< HEAD
=======
import 'screen/pim/pimScreen.dart';
>>>>>>> e676ad7894775a7d1133a1ca6b36e6fdb3cfa510

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PanduanScreen.routeName: (context) => PanduanScreen(),
  JadwalScreen.routeName: (context) => JadwalScreen(),
  LogBookScreen.routeName: (context) => LogBookScreen(),
  FollowUpScreen.routeName: (context) => FollowUpScreen(),
  AbsenScreen.routeName: (context) => AbsenScreen(),
  NilaiScreen.routeName: (context) => NilaiScreen(),
  PembimbingScreen.routeName: (context) => PembimbingScreen(),
  BeritaScreen.routeName: (context) => BeritaScreen(),
  EvaluasiScreen.routeName: (context) => EvaluasiScreen(),
  EvaluasiDosenScreen.routeName: (context) => EvaluasiDosenScreen(),
  DataHadir.routeName: (context) => DataHadir(),
  EvaluasiDiriScreen.routeName: (context) => EvaluasiDiriScreen(),
  FormEvaluasiDosenScreen.routeName: (context) => FormEvaluasiDosenScreen(),
  LihatPanduan.routeName: (context) => LihatPanduan(),
  LihatPanduanApp.routeName: (context) => LihatPanduanApp(),
  MaintenanceScreen.routeName: (context) => MaintenanceScreen(),
<<<<<<< HEAD
=======
  PimScreen.routeName: (context) => PimScreen(),
>>>>>>> e676ad7894775a7d1133a1ca6b36e6fdb3cfa510
};
