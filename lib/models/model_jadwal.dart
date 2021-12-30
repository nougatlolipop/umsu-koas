class Jadwal {
  bool status;
  String message;
  List<Data> data;

  Jadwal({
    this.status,
    this.message,
    this.data,
  });

  Jadwal.fromJson(Map<String, dynamic> json) {
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
  String jadwalId;
  String rumahSakitNama;
  String bagianNama;
  String jadwalTanggalMulai;
  String jadwalTanggalSelesai;

  Data({
    this.jadwalId,
    this.rumahSakitNama,
    this.bagianNama,
    this.jadwalTanggalMulai,
    this.jadwalTanggalSelesai,
  });

  Data.fromJson(Map<String, dynamic> json) {
    jadwalId = json['jadwalId'];
    rumahSakitNama = json['rumahSakitNama'];
    bagianNama = json['bagianNama'];
    jadwalTanggalMulai = json['jadwalTanggalMulai'];
    jadwalTanggalSelesai = json['jadwalTanggalSelesai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jadwalId'] = this.jadwalId;
    data['rumahSakitNama'] = this.rumahSakitNama;
    data['bagianNama'] = this.bagianNama;
    data['jadwalTanggalMulai'] = this.jadwalTanggalMulai;
    data['jadwalTanggalSelesai'] = this.jadwalTanggalSelesai;
    return data;
  }
}
