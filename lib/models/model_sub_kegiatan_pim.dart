class ModelSubKegiatanPim {
  String pimKegiatanId;
  String pimKegiatanKategoriId;
  String pimKegiatanNama;

  ModelSubKegiatanPim({
    this.pimKegiatanId,
    this.pimKegiatanKategoriId,
    this.pimKegiatanNama,
  });

  ModelSubKegiatanPim.fromJson(Map<String, dynamic> json) {
    pimKegiatanId = json['pimKegiatanId'].toString();
    pimKegiatanKategoriId = json['pimKegiatanKategoriId'];
    pimKegiatanNama = json['pimKegiatanNama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pimKegiatanId'] = this.pimKegiatanId;
    data['pimKegiatanKategoriId'] = this.pimKegiatanKategoriId;
    data['pimKegiatanNama'] = this.pimKegiatanNama;
    return data;
  }
}
