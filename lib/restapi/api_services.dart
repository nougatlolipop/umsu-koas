import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:umsukoas/models/model_absen.dart';
import 'package:umsukoas/models/model_jadwal.dart';
import 'package:umsukoas/models/model_login.dart';
import 'package:umsukoas/models/model_myjadwal.dart';
import '../config.dart';
import '../models/model_menu.dart';
import '../models/model_announcement.dart';

class APIService {
  Future<List<Menu>> getMenus() async {
    List<Menu> data = new List<Menu>();

    try {
      String url = Config.url + Config.urlMenu;
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data['data'] as List)
            .map((i) => Menu.fromJson(i))
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<List<Announcement>> getAnnouncements() async {
    List<Announcement> data = new List<Announcement>();

    try {
      String url = Config.url + Config.urlAnnouncements;
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data['data'] as List)
            .map((i) => Announcement.fromJson(i))
            .toList();
      }
      // print(data);
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<LoginModel> loginUser(
    String npm,
    String password,
  ) async {
    LoginModel model;
    try {
      String url = Config.url + Config.urlLogin;
      // print(url);
      var response = await Dio().post(
        url,
        data: {"npm": npm, "password": password},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = LoginModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<Jadwal> getJadwal(
    String npm,
  ) async {
    Jadwal model;
    try {
      String url = Config.url + Config.urlJadwal;
      // print(url);
      var response = await Dio().post(
        url,
        data: {"npm": npm},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = Jadwal.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<MyJadwal> getMyJadwal(
    String npm,
  ) async {
    MyJadwal model;
    try {
      String url = Config.url + Config.urlMyJadwal;
      // print(url);
      var response = await Dio().post(
        url,
        data: {"npm": npm},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = MyJadwal.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<AbsenModel> absenUser(
    String npm,
    String keterangan,
    String latlong,
    String geolokasi,
  ) async {
    AbsenModel model;
    try {
      String url = Config.url + Config.urlAbsen;
      print(url);
      var response = await Dio().post(
        url,
        data: {
          "npm": npm,
          "keterangan": keterangan,
          "latlong": latlong,
          "geolokasi": geolokasi,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = AbsenModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<List<dynamic>> getBerita() async {
    List<dynamic> data = [];

    try {
      String url = Config.urlBerita;
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = response.data;
      }
      print(data);
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }
}
