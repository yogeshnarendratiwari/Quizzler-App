import 'package:flutter/material.dart';

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
int questionNumber = 0;
List <Icon> scoreKeeper = [];
List <String> question = ['can monkey fly?','number of teeth in human body is 32?','number of bones in human body is 206?'];

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
                    question[questionNumber],
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
                   questionNumber++;
                   scoreKeeper.add(const Icon(
                     Icons.check,
                     color: Colors.green,
                   ));
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
                    questionNumber++;
                    scoreKeeper.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
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
          // TODO : add a score keeper here
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

