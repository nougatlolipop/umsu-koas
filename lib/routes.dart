import 'package:flutter/widgets.dart';
import 'screen/rekammedis/rekammedisScreen.dart';
import 'package:umsukoas/screen/pembimbing/pembimbingScreen.dart';
import 'screen/pembayaran/pembayaranSreen.dart';
import 'screen/absen/absenScreen.dart';
import 'screen/jadwal/jadwalScreen.dart';
import 'screen/logbook/logbookScreen.dart';
import 'screen/nilai/nilaiAcreen.dart';
import 'screen/panduan/panduanScreen.dart';
import 'screen/profile/profileScreen.dart';
import 'screen/berita/beritaScreen.dart';
import 'screen/login/loginScreen.dart';
import 'screen/home/homeScreen.dart';
import 'screen/welcome/welcomeScreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PanduanScreen.routeName: (context) => PanduanScreen(),
  JadwalScreen.routeName: (context) => JadwalScreen(),
  LogBookScreen.routeName: (context) => LogBookScreen(),
  RekamMedisScreen.routeName: (context) => RekamMedisScreen(),
  AbsenScreen.routeName: (context) => AbsenScreen(),
  NilaiScreen.routeName: (context) => NilaiScreen(),
  PembimbingScreen.routeName: (context) => PembimbingScreen(),
  BeritaScreen.routeName: (context) => BeritaScreen(),
  PembayaranScreen.routeName: (context) => PembayaranScreen()
};
