import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'QuestionBank.dart';

class Quiz {
  List <Icon> scoreKeeper = [];
  List<QuestionBank> _questionBank = [
    QuestionBank(q: 'can monkey fly?', a: false),
    QuestionBank(q: 'number of teeth in human body is 32?', a: true),
    QuestionBank(q: 'number of bones in human body is 206?', a: true),
    QuestionBank(q: 'Are you fool', a: false)
  ];
  int _questionNumber = 0;


  void score(bool result) {
    if (result) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    }
    else {
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }
  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
  }




  String getQuestion(){
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer(){
    return _questionBank[_questionNumber].answer;
  }

}
