class MyNilaiPim {
  bool status;
  String message;
  List<Data> data;

  MyNilaiPim({
    this.status,
    this.message,
    this.data,
  });

  MyNilaiPim.fromJson(Map<String, dynamic> json) {
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
  String pimKategoriNama;
  String pimKegiatanNama;
  String pimNilaiTotal;
  String pimNilaiSkor;
  String pimNilaiHasil;

  Data({
    this.pimKategoriNama,
    this.pimKegiatanNama,
    this.pimNilaiTotal,
    this.pimNilaiSkor,
    this.pimNilaiHasil,
  });

  Data.fromJson(Map<String, dynamic> json) {
    pimKategoriNama = json['pimKategoriNama'];
    pimKegiatanNama = json['pimKegiatanNama'];
    pimNilaiTotal = json['pimNilaiTotal'].toString();
    pimNilaiSkor = json['pimNilaiSkor'];
    pimNilaiHasil = json['pimNilaiHasil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pimKategoriNama'] = this.pimKategoriNama;
    data['pimKegiatanNama'] = this.pimKegiatanNama;
    data['pimNilaiTotal'] = this.pimNilaiTotal;
    data['pimNilaiSkor'] = this.pimNilaiSkor;
    data['pimNilaiHasil'] = this.pimNilaiHasil;
    return data;
  }
}
