import 'package:flutter/material.dart';
import 'package:umsukoas/constants.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  final String angka;

  Answer(this.selectHandler, this.answerText, this.angka);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectHandler,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kPrimaryColor.withOpacity(0.7),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: Text(angka, style: TextStyle(color: Colors.black54)),
            ),
            SizedBox(width: 8),
            Text(
              answerText,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
