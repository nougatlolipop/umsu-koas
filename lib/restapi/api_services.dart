import 'dart:io';

import 'package:dio/dio.dart';
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
      print(url);
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
      print(url);
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
      print(url);
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
}
