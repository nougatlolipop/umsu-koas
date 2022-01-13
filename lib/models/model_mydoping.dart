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

  Data({
    this.dopingNamaLengkap,
    this.rumahSakitShortname,
  });

  Data.fromJson(Map<String, dynamic> json) {
    dopingNamaLengkap = json['dopingNamaLengkap'];
    rumahSakitShortname = json['rumahSakitShortname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dopingNamaLengkap'] = this.dopingNamaLengkap;
    data['rumahSakitShortname'] = this.rumahSakitShortname;

    return data;
  }
}
