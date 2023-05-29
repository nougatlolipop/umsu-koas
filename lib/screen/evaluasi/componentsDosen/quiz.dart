import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<dynamic> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    List<String> angka = ['1', '2', '3', '4', '5', '6'];
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ), //Question
        for (var i = 0; i < 5; i++)
          Answer(
              () => answerQuestion(questions[questionIndex]['id'],
                  questions[questionIndex]['answers'][i]['score']),
              questions[questionIndex]['answers'][i]['text'],
              angka[i])
      ],
    ); //Column
  }
}
