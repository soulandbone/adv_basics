import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/widgets/questions_screen.dart';
import 'package:adv_basics/widgets/results_screen.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/widgets/start_screen.dart';

const List<Color> colors = [
  Color.fromARGB(255, 78, 13, 151),
  Color.fromARGB(255, 107, 15, 168),
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        //selectedAnswers =
        //[]; //resets the number of selectedAnswers, because it has come back to zero
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              activeScreen == 'start-screen'
                  ? StartScreen(switchScreen)
                  : activeScreen == 'questions-screen'
                  ? QuestionsScreen(onSelectAnswer: chooseAnswer)
                  : ResultsScreen(selectedAnswers, restartQuiz),
        ),
      ),
    );
  }
}
