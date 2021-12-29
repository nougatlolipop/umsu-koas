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
  String registerNumber;
  String studentId;
  String npm;
  String fullname;
  String email;
  String phone;
  String prodi;
  String password;
  String alamat;

  Data({
    this.registerNumber,
    this.studentId,
    this.npm,
    this.fullname,
    this.email,
    this.phone,
    this.prodi,
    this.password,
    this.alamat,
  });

  Data.fromJson(Map<String, dynamic> json) {
    registerNumber = json['Register_Number'];
    studentId = json['Student_Id'];
    npm = json['NPM'];
    fullname = json['FULLNAME'];
    email = json['EMAIL'];
    phone = json['PHONE'];
    prodi = json['PRODI'];
    password = json['PASSWORD'];
    alamat = json['ALAMAT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Register_Number'] = this.registerNumber;
    data['Student_Id'] = this.studentId;
    data['NPM'] = this.npm;
    data['FULLNAME'] = this.fullname;
    data['EMAIL'] = this.email;
    data['PHONE'] = this.phone;
    data['PRODI'] = this.prodi;
    data['PASSWORD'] = this.password;
    data['ALAMAT'] = this.alamat;
    return data;
  }
}
