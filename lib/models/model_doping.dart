class ModelDoping {
  String dopingId;
  String dopingNamaLengkap;

  ModelDoping({
    this.dopingId,
    this.dopingNamaLengkap,
  });

  ModelDoping.fromJson(Map<String, dynamic> json) {
    dopingId = json['dopingId'].toString();
    dopingNamaLengkap = json['dopingNamaLengkap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dopingId'] = this.dopingId;
    data['dopingNamaLengkap'] = this.dopingNamaLengkap;
    return data;
  }
}
