import 'package:flutter/material.dart';
import 'quizz_brain.dart';

void main() => runApp(Quizzler());

QuizzBrain quizzBrain = new QuizzBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  void check() {
    scoreKeeper.add(
      Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  void close() {
    scoreKeeper.add(
      Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }

//  List<String> questions = [
//    'You can lead a cow down stairs but not up stairs.',
//    'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.',
//  ];

//  List<bool> answers = [
//    false,
//    true,
//    true,
//  ];

//  List<Question> questionBank = [
//    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
//    Question(
//        q: 'Approximately one quarter of human bones are in the feet.',
//        a: true),
//    Question(q: 'A slug\'s blood is green.', a: true),
//  ];

//  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                // The user pick True
                bool correctAnswer = quizzBrain.getCorrectAnswer();
                if (correctAnswer == true) {
                  check();
                } else {
                  close();
                }
                setState(() {
                  quizzBrain.nextQuestion();
                });
              },
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                // The user pick False
                bool correctAnswer = quizzBrain.getCorrectAnswer();
                if (correctAnswer == false) {
                  check();
                } else {
                  close();
                }
                setState(() {
                  quizzBrain.nextQuestion();
                });
              },
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
* question1: 'You can lead a cow down stairs but not up stairs.', false
* question2: 'Approximately one quarter of human bones are in the feet.', true
* question3: 'A slug\'s blood is green.', true
* */
