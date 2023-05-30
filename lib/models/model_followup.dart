class FollowUp {
  bool status;
  String message;
  List<Data> data;

  FollowUp({
    this.status,
    this.message,
    this.data,
  });

  FollowUp.fromJson(Map<String, dynamic> json) {
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
  String followUpId;
  String followUpTglPeriksa;
  String staseNama;
  String rumahSakitShortname;
  String followUpKasusSOAP;
  String dopingNamaLengkap;
  String followUpVerify;

  Data({
    this.followUpId,
    this.followUpTglPeriksa,
    this.staseNama,
    this.rumahSakitShortname,
    this.followUpKasusSOAP,
    this.dopingNamaLengkap,
    this.followUpVerify,
  });

  Data.fromJson(Map<String, dynamic> json) {
    followUpId = json['followUpId'];
    followUpTglPeriksa = json['followUpTglPeriksa'];
    staseNama = json['staseNama'];
    rumahSakitShortname = json['rumahSakitShortname'];
    followUpKasusSOAP = json['followUpKasusSOAP'];
    dopingNamaLengkap = json['dopingNamaLengkap'];
    followUpVerify = json['followUpVerify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followUpId'] = this.followUpId;
    data['followUpTglPeriksa'] = this.followUpTglPeriksa;
    data['staseNama'] = this.staseNama;
    data['rumahSakitShortname'] = this.rumahSakitShortname;
    data['followUpKasusSOAP'] = this.followUpKasusSOAP;
    data['dopingNamaLengkap'] = this.dopingNamaLengkap;
    data['followUpVerify'] = this.followUpVerify;
    return data;
  }
}
