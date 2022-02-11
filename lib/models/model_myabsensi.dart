class MyAbsensi {
  bool status;
  String message;
  List<Data> data;

  MyAbsensi({
    this.status,
    this.message,
    this.data,
  });

  MyAbsensi.fromJson(Map<String, dynamic> json) {
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
  String absensiId;
  String absensiNim;
  String absensiTanggal;
  String absensiKeterangan;
  String absensiLokasi;

  Data({
    this.absensiId,
    this.absensiNim,
    this.absensiTanggal,
    this.absensiKeterangan,
    this.absensiLokasi,
  });

  Data.fromJson(Map<String, dynamic> json) {
    absensiId = json['absensiId'];
    absensiNim = json['absensiNim'];
    absensiTanggal = json['absensiTanggal'];
    absensiKeterangan = json['absensiKeterangan'];
    absensiLokasi = json['absensiLokasi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['absensiId'] = this.absensiId;
    data['absensiNim'] = this.absensiNim;
    data['absensiTanggal'] = this.absensiTanggal;
    data['absensiKeterangan'] = this.absensiKeterangan;
    data['absensiLokasi'] = this.absensiLokasi;
    return data;
  }
}
