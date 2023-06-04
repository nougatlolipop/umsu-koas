class Kehadiran {
  bool status;
  String message;
  List<Data> data;

  Kehadiran({
    this.status,
    this.message,
    this.data,
  });

  Kehadiran.fromJson(Map<String, dynamic> json) {
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
  String absensiTahunAkademik;
  String absensiNim;
  String absensiTanggal;
  String absensiLatLong;
  String absensiLokasi;
  String kelompokDetNama;
  String absensiKeterangan;

  Data({
    this.absensiTahunAkademik,
    this.absensiNim,
    this.absensiTanggal,
    this.absensiLatLong,
    this.absensiLokasi,
    this.kelompokDetNama,
    this.absensiKeterangan,
  });

  Data.fromJson(Map<String, dynamic> json) {
    absensiTahunAkademik = json['absensiTahunAkademik'];
    absensiNim = json['absensiNim'];
    absensiTanggal = json['absensiTanggal'];
    absensiLatLong = json['absensiLatLong'];
    absensiLokasi = json['absensiLokasi'];
    kelompokDetNama = json['kelompokDetNama'];
    absensiKeterangan = json['absensiKeterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['absensiTahunAkademik'] = this.absensiTahunAkademik;
    data['absensiNim'] = this.absensiNim;
    data['absensiTanggal'] = this.absensiTanggal;
    data['absensiLatLong'] = this.absensiLatLong;
    data['absensiLokasi'] = this.absensiLokasi;
    data['kelompokDetNama'] = this.kelompokDetNama;
    data['absensiKeterangan'] = this.absensiKeterangan;
    return data;
  }
}
