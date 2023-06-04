class ModelStase {
  String staseId;
  String staseNama;

  ModelStase({
    this.staseId,
    this.staseNama,
  });

  ModelStase.fromJson(Map<String, dynamic> json) {
    staseId = json['staseId'].toString();
    staseNama = json['staseNama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staseId'] = this.staseId;
    data['staseNama'] = this.staseNama;
    return data;
  }
}
