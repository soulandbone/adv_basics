import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(20, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.1,
          //   child: Image.asset('assets/images/quiz-logo.png', width: 300),
          // ),
          SizedBox(height: 80),
          (Text(
            'Learn Flutter the fun way!',
            style: TextStyle(fontSize: 22, color: Colors.white),
          )),
          SizedBox(height: 80),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            onPressed: startQuiz,
            label: Text('Start Quiz', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
