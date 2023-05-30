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
  String namaDosen, dopingEmail;

  @override
  void initState() {
    apiService = new APIService();
    Config.hasilEvaluasi = [];
    getSoalEvaluasi();
    super.initState();
  }

  Future<SoalEvaluasi> getSoalEvaluasi() async {
    jsonString = await apiService
        .getSoalEvaluasi()
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
    hasil.add({'aspek': id, 'nilai': score.toString()});

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
      //disini perintah simpan
      print(dopingEmail + ' ' + jsonEncode(hasil));
      saveEvaluasi(dopingEmail, jsonEncode(hasil));
    }
  }

  Future<void> saveEvaluasi(dopingEmail, nilai) {
    apiService.saveEvaluasi(dopingEmail, Config.npm, nilai).then(
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
    final ParamString args = ModalRoute.of(context).settings.arguments;
    namaDosen = args.namaDosen.toString();
    dopingEmail = args.dopingEmail.toString();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: _questionIndex < _questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Daftar Pertanyaan Untuk Penilaian Terhadap Dosen Pembimbing Dengan Nama ${namaDosen}",
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
