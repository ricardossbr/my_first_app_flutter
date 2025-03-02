import 'package:flutter/material.dart';

import 'question.dart';

class Questionary extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final List<Widget> widgets;
  
  const Questionary(this.questionIndex, this.questions, this.widgets, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Question(questions[questionIndex]['text'].toString()),
            ...widgets       
          ],
        );
  }
}