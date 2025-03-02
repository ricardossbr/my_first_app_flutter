import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final void Function() _resetQuiz;
  const Result(this._totalScore, this._resetQuiz, {super.key,});

  String get text{
    print(_totalScore);
    if(_totalScore < 8){
      return  'You are awesome and innocent!';
    }  
    if(_totalScore < 12){
      return  'Pretty likeable!';
    } 
    if(_totalScore < 16){
      return 'You are ... strange?!';
    }
    return 'You are like a machine!!!';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 36),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                ),
                onPressed: _resetQuiz,
                child: Text('Restart Quiz!'),
              ),
            ],
          ),
        );
  }
}