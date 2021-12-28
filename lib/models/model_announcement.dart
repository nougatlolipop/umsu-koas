class Announcement {
  String pengumumanId;
  String pengumumanJudul;
  String pengumumanIsi;

  Announcement({
    this.pengumumanId,
    this.pengumumanJudul,
    this.pengumumanIsi,
  });

  Announcement.fromJson(Map<String, dynamic> json) {
    pengumumanId = json['pengumumanId'];
    pengumumanJudul = json['pengumumanJudul'];
    pengumumanIsi = json['pengumumanIsi'];
  }
}
