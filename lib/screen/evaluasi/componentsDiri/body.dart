import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/models/model_evaluasi.dart';
import 'package:umsukoas/restapi/api_services.dart';
import '../body.dart';
import 'quiz.dart';

import '../../../config.dart';
import 'result.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  APIService apiService;
  List<dynamic> soal = [];
  String jsonString = '';
  var _questions = [];
  var hasil = [];

  @override
  void initState() {
    apiService = new APIService();
    Config.hasilEvaluasi = [];
    getSoalEvaluasi();
    super.initState();
  }

  Future<SoalEvaluasi> getSoalEvaluasi() async {
    jsonString = await apiService
        .getSoalEvaluasiDiri()
        .then((value) => jsonEncode(value.data));

    setState(() {
      _questions = jsonDecode(jsonString);
    });
  }

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(String id, int score) {
    _totalScore += score;
    hasil.add({'tujuan': id, 'nilai': score.toString()});

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
      //disini perintah simpan
      print(jsonEncode(hasil));
      saveRefleksi(jsonEncode(hasil));
    }
  }

  Future<void> saveRefleksi(nilai) {
    apiService.saveRefleksi(Config.npm, nilai).then(
      (ret) {
        print(ret.toJson());
        if (ret.status) {
          SweetAlert.show(
            context,
            title: "KOAS UMSU",
            subtitle: ret.message,
            style: SweetAlertStyle.success,
          );
        } else {
          SweetAlert.show(
            context,
            title: "KOAS UMSU",
            subtitle: ret.message,
            style: SweetAlertStyle.error,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: _questionIndex < _questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Daftar Pertanyaan Untuk Penilaian Terhadap Refleksi Diri Sendiri",
                  style: TextStyle(color: kPrimaryColor),
                ),
                Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ),
              ],
            ) //Quiz
          : Result(_totalScore),
    );
  }
}
