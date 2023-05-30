class ModelSemesterNilaiPim {
  String pimGradeSemester;

  ModelSemesterNilaiPim({
    this.pimGradeSemester,
  });

  ModelSemesterNilaiPim.fromJson(Map<String, dynamic> json) {
    pimGradeSemester = json['pimGradeSemester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pimGradeSemester'] = this.pimGradeSemester;
    return data;
  }
}
