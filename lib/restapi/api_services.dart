import 'dart:io';

import 'package:dio/dio.dart';
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
      print(data);
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }
}
