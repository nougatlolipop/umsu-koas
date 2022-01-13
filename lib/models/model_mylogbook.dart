class MyLogbook {
  bool status;
  String message;
  List<Data> data;

  MyLogbook({
    this.status,
    this.message,
    this.data,
  });

  MyLogbook.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Data {
  String logbookId;
  String kegiatanNama;
  String staseNama;
  String rumahSakitShortname;
  String logbookTanggal;
  String logbookCreateDate;
  String dopingNamaLengkap;
  String logbookJudulDeskripsi;
  String logbookDeskripsi;
  String logbookIsVerify;

  Data({
    this.logbookId,
    this.kegiatanNama,
    this.staseNama,
    this.rumahSakitShortname,
    this.logbookTanggal,
    this.logbookCreateDate,
    this.dopingNamaLengkap,
    this.logbookJudulDeskripsi,
    this.logbookDeskripsi,
    this.logbookIsVerify,
  });

  Data.fromJson(Map<String, dynamic> json) {
    logbookId = json['logbookId'];
    kegiatanNama = json['kegiatanNama'];
    staseNama = json['staseNama'];
    rumahSakitShortname = json['rumahSakitShortname'];
    logbookTanggal = json['logbookTanggal'];
    logbookCreateDate = json['logbookCreateDate'];
    dopingNamaLengkap = json['dopingNamaLengkap'];
    logbookJudulDeskripsi = json['logbookJudulDeskripsi'];
    logbookDeskripsi = json['logbookDeskripsi'];
    logbookIsVerify = json['logbookIsVerify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logbookId'] = this.logbookId;
    data['kegiatanNama'] = this.kegiatanNama;
    data['staseNama'] = this.staseNama;
    data['rumahSakitShortname'] = this.rumahSakitShortname;
    data['logbookTanggal'] = this.logbookTanggal;
    data['logbookCreateDate'] = this.logbookCreateDate;
    data['dopingNamaLengkap'] = this.dopingNamaLengkap;
    data['logbookJudulDeskripsi'] = this.logbookJudulDeskripsi;
    data['logbookDeskripsi'] = this.logbookDeskripsi;
    data['logbookIsVerify'] = this.logbookIsVerify;
    return data;
  }
}
