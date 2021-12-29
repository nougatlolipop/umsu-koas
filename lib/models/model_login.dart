class LoginModel {
  bool status;
  String message;
  List<Data> data;

  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String Register_Number;
  int Student_Id;
  String NPM;
  String FULLNAME;
  String EMAIL;
  String PHONE;
  String PRODI;
  String PASSWORD;
  String ALAMAT;

  Data({
    this.Register_Number,
    this.Student_Id,
    this.NPM,
    this.FULLNAME,
    this.EMAIL,
    this.PHONE,
    this.PRODI,
    this.PASSWORD,
    this.ALAMAT,
  });

  Data.fromJson(Map<String, dynamic> json) {
    Register_Number = json['Register_Number'];
    Student_Id = json['Student_Id'];
    NPM = json['NPM'];
    FULLNAME = json['FULLNAME'];
    EMAIL = json['EMAIL'];
    PHONE = json['PHONE'];
    PRODI = json['PRODI'];
    PASSWORD = json['PASSWORD'];
    ALAMAT = json['ALAMAT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Register_Number'] = this.Register_Number;
    data['Student_Id'] = this.Student_Id;
    data['NPM'] = this.NPM;
    data['FULLNAME'] = this.FULLNAME;
    data['EMAIL'] = this.EMAIL;
    data['PHONE'] = this.PHONE;
    data['PRODI'] = this.PRODI;
    data['PASSWORD'] = this.PASSWORD;
    data['ALAMAT'] = this.ALAMAT;
    return data;
  }
}
