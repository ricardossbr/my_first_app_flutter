import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String _text;
  final void Function() _answerQuestion;

  const Answers(this._text, this._answerQuestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                ),
                onPressed: _answerQuestion,
                child: Text(_text),
              ),
    );
  }
}