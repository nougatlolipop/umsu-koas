class MyDoping {
  bool status;
  String message;
  List<Data> data;

  MyDoping({
    this.status,
    this.message,
    this.data,
  });

  MyDoping.fromJson(Map<String, dynamic> json) {
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
  String dopingNamaLengkap;
  String rumahSakitShortname;
  String dopingId;
  String dopingEmail;

  Data(
      {this.dopingNamaLengkap,
      this.rumahSakitShortname,
      this.dopingId,
      this.dopingEmail});

  Data.fromJson(Map<String, dynamic> json) {
    dopingId = json['dopingId'];
    dopingNamaLengkap = json['dopingNamaLengkap'];
    rumahSakitShortname = json['rumahSakitShortname'];
    dopingEmail = json['dopingEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dopingNamaLengkap'] = this.dopingNamaLengkap;
    data['rumahSakitShortname'] = this.rumahSakitShortname;
    data['dopingId'] = this.dopingId;
    data['dopingEmail'] = this.dopingEmail;
    return data;
  }
}
