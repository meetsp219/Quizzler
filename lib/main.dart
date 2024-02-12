import 'package:flutter/material.dart';
import 'package:quizzler/quizBrain.dart';

void main() => runApp(MyApp());

QuizBrain quizBrain = new QuizBrain();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreCardIcons = [];

  void checkAnswer(bool userChosenAnswer) {
    setState(() {
      if (quizBrain.checkAnswer(userChosenAnswer)) {
        scoreCardIcons.add(
          Icon(
            Icons.check,
            color: Colors.green,
            size: 25,
          ),
        );
      } else {
        scoreCardIcons.add(
          Icon(
            Icons.close,
            color: Colors.red,
            size: 25,
          ),
        );
      }

      if (quizBrain.quizEnded()) {
        //display score in alert
        print('quiz ended...!!!');
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            'Question ${quizBrain.currentQuestion + 1} of ${quizBrain.questionBank.length}',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              quizBrain.getQuestion(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.green,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.red,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: TextButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: scoreCardIcons,
        )
      ],
    );
  }
}
