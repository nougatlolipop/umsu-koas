class ModelRumkit {
  String rumahSakitId;
  String rumahSakitDetailId;
  String rumahSakitNama;

  ModelRumkit({
    this.rumahSakitId,
    this.rumahSakitDetailId,
    this.rumahSakitNama,
  });

  ModelRumkit.fromJson(Map<String, dynamic> json) {
    rumahSakitId = json['rumahSakitId'].toString();
    rumahSakitDetailId = json['rumkitDetId'].toString();
    rumahSakitNama = json['rumahSakitShortname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rumahSakitId'] = this.rumahSakitId;
    data['rumkitDetId'] = this.rumahSakitDetailId;
    data['rumahSakitShortname'] = this.rumahSakitNama;
    return data;
  }
}
