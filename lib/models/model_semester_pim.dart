class ModelSemesterPim {
  String pimJadwalSemester;

  ModelSemesterPim({
    this.pimJadwalSemester,
  });

  ModelSemesterPim.fromJson(Map<String, dynamic> json) {
    pimJadwalSemester = json['pimJadwalSemester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pimJadwalSemester'] = this.pimJadwalSemester;
    return data;
  }
}
