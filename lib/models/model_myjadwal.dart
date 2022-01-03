class MyJadwal {
  bool status;
  String message;
  List<Data> data;

  MyJadwal({
    this.status,
    this.message,
    this.data,
  });

  MyJadwal.fromJson(Map<String, dynamic> json) {
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
  String staseNama;
  String jadwalTanggalMulai;
  String jadwalTanggalSelesai;
  String rumahSakitAlamat;
  String rumahSakitTelp;

  Data({
    this.jadwalId,
    this.rumahSakitNama,
    this.staseNama,
    this.jadwalTanggalMulai,
    this.jadwalTanggalSelesai,
    this.rumahSakitAlamat,
    this.rumahSakitTelp,
  });

  Data.fromJson(Map<String, dynamic> json) {
    jadwalId = json['jadwalId'];
    rumahSakitNama = json['rumahSakitNama'];
    staseNama = json['staseNama'];
    jadwalTanggalMulai = json['jadwalTanggalMulai'];
    jadwalTanggalSelesai = json['jadwalTanggalSelesai'];
    rumahSakitAlamat = json['rumahSakitAlamat'];
    rumahSakitTelp = json['rumahSakitTelp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jadwalId'] = this.jadwalId;
    data['rumahSakitNama'] = this.rumahSakitNama;
    data['staseNama'] = this.staseNama;
    data['jadwalTanggalMulai'] = this.jadwalTanggalMulai;
    data['jadwalTanggalSelesai'] = this.jadwalTanggalSelesai;
    data['rumahSakitAlamat'] = this.rumahSakitAlamat;
    data['rumahSakitTelp'] = this.rumahSakitTelp;
    return data;
  }
}
