import 'package:first_app/answers.dart';
import 'package:first_app/questionary.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final List<Map<String, Object>> _questions = const [
      {
        'text': 'What\'s your favorite color?',
        'answer': [
          {'text':'Black', 'value': 10},
          {'text':'Red', 'value': 6},
          {'text':'Green', 'value': 3},
          {'text':'White','value': 1},
          ],
      },
      {
        'text': 'What\'s your favorite animal?',
        'answer': [
          {'text':'Dog', 'value': 10},
          {'text':'Snake', 'value': 3},
          {'text':'Elephant', 'value': 3},
          {'text':'Horse','value': 1}
          ],
      },
      {
        'text': 'What\'s your favorite soccer player?',
        'answer': [
          {'text':'CR7', 'value': 8},
          {'text':'Messi', 'value': 10},
          {'text':'Menino Ney', 'value': 9},
          {'text':'Mbappé','value': 1},
          ],
      },
    ];

  void _answerQuestion(int value) {
    if(hasQuestion){  
      setState(() {
        _questionIndex++;
        _totalScore += value;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  bool get hasQuestion {
    return _questionIndex < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> answers = hasQuestion ? _questions[_questionIndex]['answer'] as List<Map<String, Object>> : [];
    List<Widget> widgets = answers.map((answer) => Answers(answer['text'].toString(), () => _answerQuestion(answer['value'] as int))).toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: hasQuestion ? 
          Questionary(_questionIndex,_questions,widgets) 
        : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
