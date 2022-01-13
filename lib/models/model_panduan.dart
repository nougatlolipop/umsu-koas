class Panduan {
  bool status;
  String message;
  List<Data> data;

  Panduan({
    this.status,
    this.message,
    this.data,
  });

  Panduan.fromJson(Map<String, dynamic> json) {
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
  String panduanFile;
  String panduanFileStore;

  Data({
    this.panduanFile,
    this.panduanFileStore,
  });

  Data.fromJson(Map<String, dynamic> json) {
    panduanFile = json['panduanFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['panduanFile'] = this.panduanFile;
    return data;
  }
}
