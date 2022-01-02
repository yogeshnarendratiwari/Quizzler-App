import 'package:flutter/material.dart';
import 'Quiz.dart';

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


Quiz q = Quiz();
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
                   q.getQuestion(),
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
                    q.score(q.getAnswer());
                    q.nextQuestion();

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
                       q.score(!q.getAnswer());
                       q.nextQuestion();
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
              children: q.scoreKeeper ,
            ),
          )
        ],
      ),
    );
  }
}

