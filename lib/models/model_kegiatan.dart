class ModelKegiatan {
  String kegiatanId;
  String kegiatanNama;

  ModelKegiatan({
    this.kegiatanId,
    this.kegiatanNama,
  });

  ModelKegiatan.fromJson(Map<String, dynamic> json) {
    kegiatanId = json['kegiatanId'].toString();
    kegiatanNama = json['kegiatanNama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kegiatanId'] = this.kegiatanId;
    data['kegiatanNama'] = this.kegiatanNama;
    return data;
  }
}
