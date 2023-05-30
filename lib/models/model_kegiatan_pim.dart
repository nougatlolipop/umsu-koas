class ModelKegiatanPim {
  String pimKategoriId;
  String pimKategoriNama;
  String pimKategoriIsShow;
  String pimKategoriIsSelect;

  ModelKegiatanPim({
    this.pimKategoriId,
    this.pimKategoriNama,
    this.pimKategoriIsShow,
    this.pimKategoriIsSelect,
  });

  ModelKegiatanPim.fromJson(Map<String, dynamic> json) {
    pimKategoriId = json['pimKategoriId'].toString();
    pimKategoriNama = json['pimKategoriNama'];
    pimKategoriIsShow = json['pimKategoriIsShow'];
    pimKategoriIsSelect = json['pimKategoriIsSelect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pimKategoriId'] = this.pimKategoriId;
    data['pimKategoriNama'] = this.pimKategoriNama;
    data['pimKategoriIsShow'] = this.pimKategoriIsShow;
    data['pimKategoriIsSelect'] = this.pimKategoriIsSelect;
    return data;
  }
}
