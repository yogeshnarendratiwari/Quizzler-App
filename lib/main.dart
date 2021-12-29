import 'package:flutter/material.dart';
import 'QuestionBank.dart';

void main() => runApp(
      const MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Quizzler(),
        ),
      ),
    );

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

void scoreKeeperViewer(bool x){
  if (x) {
      scoreKeeper.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
  }
  else {
      scoreKeeper.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
  }
  if(questionNumber<questionBank.length-1) {
      questionNumber++;

  }
  else{
    questionNumber=0;
  }
}

int questionNumber = 0;
List <Icon> scoreKeeper = [];
List <QuestionBank> questionBank = [QuestionBank(q:'can monkey fly?' , a: false),QuestionBank(q: 'number of teeth in human body is 32?', a: true),QuestionBank(q:'number of bones in human body is 206?', a: true),QuestionBank(q: 'Are you fool', a:false)];
class _QuizzlerState extends State<Quizzler> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            flex: 18,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 100.0,horizontal: 10.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    questionBank[questionNumber].question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),),
          Expanded(
            flex: 3,
            child: Padding(
              padding : const EdgeInsets.symmetric(horizontal: 15.0,vertical: 2.0),
              child:TextButton(
                onPressed: () {
                  setState(() {
                    scoreKeeperViewer(questionBank[questionNumber].answer);
                  });
                },
                child: const Text(
                  "True",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ),),
          Expanded(
            flex: 3,
            child: Padding(
              padding : const EdgeInsets.symmetric(horizontal: 15.0,vertical: 2.0),
              child:TextButton(
                onPressed: () {
                     setState(() {
                       scoreKeeperViewer(!questionBank[questionNumber].answer);
                     });
                  },

                child: const Text(
                  "False",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),),
          Expanded(
            flex: 2,
            child: Row(
              children: scoreKeeper ,
            ),
          )
        ],
      ),
    );
  }
}

