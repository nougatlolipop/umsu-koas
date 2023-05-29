class MyEvaluasi {
  bool status;
  String message;
  List<Data> data;

  MyEvaluasi({
    this.status,
    this.message,
    this.data,
  });

  MyEvaluasi.fromJson(Map<String, dynamic> json) {
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
  String text;
  bool available;
  String icon;
  String desc;
  String press;

  Data({
    this.text,
    this.available,
    this.icon,
    this.desc,
    this.press,
  });

  Data.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    available = json['available'];
    icon = json['icon'];
    desc = json['desc'];
    press = json['press'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['available'] = this.available;
    data['icon'] = this.icon;
    data['desc'] = this.desc;
    data['press'] = this.press;
    return data;
  }
}
