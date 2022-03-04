class MyNilai {
  bool status;
  String message;
  String kondite;
  String sanksi;
  String nilaiAkhir;
  String nilaiHuruf;
  List<Data> data;

  MyNilai({
    this.status,
    this.message,
    this.data,
  });

  MyNilai.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    kondite = json['kondite'];
    nilaiAkhir = json['nilaiAkhir'];
    nilaiHuruf = json['nilaiHuruf'];
    sanksi = json['sanksi'];
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
    data['kondite'] = this.kondite;
    data['sanksi'] = this.sanksi;
    data['nilaiAkhir'] = this.nilaiAkhir;
    data['nilaiHuruf'] = this.nilaiHuruf;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Data {
  String kegiatan;
  String bobot;
  String nilai;
  String hasil;

  Data({
    this.kegiatan,
    this.bobot,
    this.nilai,
    this.hasil,
  });

  Data.fromJson(Map<String, dynamic> json) {
    kegiatan = json['kegiatan'];
    bobot = json['bobot'];
    nilai = json['nilai'].toString();
    hasil = json['hasil'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kegiatan'] = this.kegiatan;
    data['bobot'] = this.bobot;
    data['nilai'] = this.nilai;
    data['hasil'] = this.hasil;
    return data;
  }
}
