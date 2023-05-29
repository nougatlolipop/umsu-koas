class PanduanApp {
  String panduanFile;
  String panduanNama;

  PanduanApp({
    this.panduanFile,
    this.panduanNama,
  });

  PanduanApp.fromJson(Map<String, dynamic> json) {
    panduanFile = json['panduanFile'];
    panduanNama = json['panduanNama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['panduanFile'] = this.panduanFile;
    data['panduanNama'] = this.panduanNama;
    return data;
  }
}
