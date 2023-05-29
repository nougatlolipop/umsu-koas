import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:umsukoas/models/model_absen.dart';
import 'package:umsukoas/models/model_doping.dart';
import 'package:umsukoas/models/model_evaluasi.dart';
import 'package:umsukoas/models/model_followup.dart';
import 'package:umsukoas/models/model_jadwal.dart';
import 'package:umsukoas/models/model_kegiatan.dart';
import 'package:umsukoas/models/model_kehadiran.dart';
import 'package:umsukoas/models/model_login.dart';
import 'package:umsukoas/models/model_myEvaluasi.dart';
import 'package:umsukoas/models/model_mydoping.dart';
import 'package:umsukoas/models/model_myjadwal.dart';
import 'package:umsukoas/models/model_mylogbook.dart';
import 'package:umsukoas/models/model_nilai.dart';
import 'package:umsukoas/models/model_panduan.dart';
import 'package:umsukoas/models/model_panduan_app.dart';
import 'package:umsukoas/models/model_refleksi.dart';
import 'package:umsukoas/models/model_rumkit.dart';
import 'package:umsukoas/models/model_save.dart';
import 'package:umsukoas/models/model_stase.dart';
import 'package:umsukoas/models/model_user.dart';
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

  Future<List<ModelRumkit>> getInitKegiatan(String npm) async {
    List<ModelRumkit> data = [];

    try {
      String url = Config.url + Config.urlInitKegiatan;
      print(url);
      var response = await Dio().post(
        url,
        data: {"npm": npm},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data['data'] as List)
            .map((i) => ModelRumkit.fromJson(i))
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<List<ModelStase>> getStaseNilai(String npm) async {
    List<ModelStase> data = [];

    try {
      String url = Config.url + Config.urlStaseNilai;
      print(url);
      var response = await Dio().post(
        url,
        data: {"npm": npm},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data['data'] as List)
            .map((i) => ModelStase.fromJson(i))
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<List<ModelDoping>> getDoping(String rsId) async {
    List<ModelDoping> data = [];

    try {
      String url = Config.url + Config.urlGetDoping;
      print(url);
      var response = await Dio().post(
        url,
        data: {"rumahSakitId": rsId},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data['data'] as List)
            .map((i) => ModelDoping.fromJson(i))
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<List<ModelKegiatan>> getKegiatan(String npm) async {
    List<ModelKegiatan> data = [];

    try {
      String url = Config.url + Config.urlGetKegiatan;
      print(url);
      var response = await Dio().post(
        url,
        data: {"npm": npm},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        data = (response.data['data'] as List)
            .map((i) => ModelKegiatan.fromJson(i))
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<SaveModel> saveLogbookWithFile(
    String rumkitDetId,
    String dopingId,
    String kegiatanId,
    String nim,
    String tanggal,
    String judul,
    String deskripsi,
    List<PlatformFile> _paths,
  ) async {
    SaveModel model;
    try {
      String url = Config.url + Config.urlLogbookWithFile;
      FormData formData = new FormData.fromMap({
        "rumkitDetId": rumkitDetId,
        "dopingId": dopingId,
        "kegiatanId": kegiatanId,
        "nim": nim,
        "tanggal": tanggal,
        "judul": judul,
        "deskripsi": deskripsi,
        "file": await MultipartFile.fromFile(
          _paths.first.path,
          filename: _paths.first.name,
        ),
      });
      var response = await Dio().post(
        url,
        data: formData,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = SaveModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<SaveModel> saveLogbook(
    String rumkitDetId,
    String dopingId,
    String kegiatanId,
    String nim,
    String tanggal,
    String judul,
    String deskripsi,
  ) async {
    SaveModel model;
    try {
      String url = Config.url + Config.urlLogbook;
      var response = await Dio().post(
        url,
        data: {
          "rumkitDetId": rumkitDetId,
          "dopingId": dopingId,
          "kegiatanId": kegiatanId,
          "nim": nim,
          "tanggal": tanggal,
          "judul": judul,
          "deskripsi": deskripsi,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = SaveModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<MyLogbook> getMyLogbook(
    String npm,
  ) async {
    MyLogbook model;
    try {
      String url = Config.url + Config.urlMyLogbook;
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
        model = MyLogbook.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<MyDoping> getMyDoping(
    String npm,
  ) async {
    MyDoping model;
    try {
      String url = Config.url + Config.urlMyDoping;
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
        model = MyDoping.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<Panduan> getPanduan() async {
    Panduan model;
    try {
      String url = Config.url + Config.urlPanduan;
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = Panduan.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<List<PanduanApp>> getPanduanApp() async {
    List<PanduanApp> data = new List<PanduanApp>();

    try {
      String url = Config.url + Config.urlPanduanApp;
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
            .map((i) => PanduanApp.fromJson(i))
            .toList();
      }
      // print(data);
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<FollowUp> getFollowUp(
    String npm,
  ) async {
    FollowUp model;
    try {
      String url = Config.url + Config.urlFollowUp;
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
        model = FollowUp.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<SaveModel> saveFollowUp(
    String rumkitDetId,
    String dopingId,
    String nim,
    String tanggal,
    String deskripsi,
  ) async {
    SaveModel model;
    try {
      String url = Config.url + Config.urlAddFollowUp;
      // print(url);
      var response = await Dio().post(
        url,
        data: {
          "rumkitDetId": rumkitDetId,
          "dopingId": dopingId,
          "npm": nim,
          "tanggal": tanggal,
          "followUpKasus": deskripsi,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = SaveModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<User> createUser(
    String npm,
    String onesignal,
  ) async {
    User model;
    try {
      String url = Config.url + Config.urlAddUser;
      print(url);
      var response = await Dio().post(
        url,
        data: {
          "npm": npm,
          "playerId": onesignal,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = User.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<MyNilai> getMyNilai(String npm, String stase) async {
    MyNilai model;
    try {
      String url = Config.url + Config.urlMyNilai;
      // print(url);
      var response = await Dio().post(
        url,
        data: {"npm": npm, "stase": stase},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = MyNilai.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<SoalEvaluasi> getSoalEvaluasi() async {
    SoalEvaluasi model;
    try {
      String url = Config.url + Config.urlSoalEvaluasi;
      // print(url);
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = SoalEvaluasi.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<SoalRefleksi> getSoalEvaluasiDiri() async {
    SoalRefleksi model;
    try {
      String url = Config.url + Config.urlSoalEvaluasiDiri;
      // print(url);
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = SoalRefleksi.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<MyEvaluasi> getMyEvaluasi(
    String npm,
  ) async {
    MyEvaluasi model;
    try {
      String url = Config.url + Config.urlMyEvaluasi;
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
        model = MyEvaluasi.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<SaveModel> saveEvaluasi(
    String emailDosen,
    String nim,
    String evaluasiNilai,
  ) async {
    SaveModel model;
    try {
      String url = Config.url + Config.urlAddEvaluasi;
      // print(url);
      var response = await Dio().post(
        url,
        data: {
          "emailDoping": emailDosen,
          "npm": nim,
          "evaluasiNilai": evaluasiNilai,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = SaveModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<SaveModel> saveRefleksi(
    String nim,
    String refleksiNilai,
  ) async {
    SaveModel model;
    try {
      String url = Config.url + Config.urlAddRefleksi;
      // print(url);
      var response = await Dio().post(
        url,
        data: {
          "npm": nim,
          "refleksiNilai": refleksiNilai,
        },
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = SaveModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<MyDoping> getMyDopingEvaluasi(
    String npm,
  ) async {
    MyDoping model;
    try {
      String url = Config.url + Config.urlMyDopingEvaluasi;
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
        model = MyDoping.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<Kehadiran> getKehadiran(String npm) async {
    Kehadiran model;
    try {
      String url = Config.url + Config.urlKehadiran;
      var response = await Dio().post(
        url,
        data: {'npm': npm},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = Kehadiran.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }

  Future<SaveModel> deleteLogbook(String idLogbook) async {
    SaveModel model;
    try {
      String url = Config.url + Config.urlDeleteKegiatan;
      // print('fikri $url');
      var response = await Dio().post(
        url,
        data: {"id": idLogbook},
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          },
        ),
      );

      if (response.statusCode == 200) {
        model = SaveModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }

    return model;
  }
}
