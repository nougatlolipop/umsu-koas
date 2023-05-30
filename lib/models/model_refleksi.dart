class SoalRefleksi {
  bool status;
  String message;
  List<Data> data;

  SoalRefleksi({
    this.status,
    this.message,
    this.data,
  });

  SoalRefleksi.fromJson(Map<String, dynamic> json) {
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
  String id;
  String questionText;
  List<Answer> answers;

  Data({
    this.id,
    this.questionText,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['questionText'];
    if (json['answers'] != null) {
      answers = new List<Answer>();
      json['answers'].forEach((v) {
        answers.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionText'] = this.questionText;
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  String text;
  int score;

  Answer({
    this.text,
    this.score,
  });

  Answer.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['score'] = this.score;
    return data;
  }
}
