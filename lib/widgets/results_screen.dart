import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/widgets/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, this.restartQuiz, {super.key});

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question_text': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int numberOfTotalQuestions = questions.length;
    int correctAnswers =
        summaryData.where((element) {
          return (element['correct_answer'] as String) ==
              ((element['user_answer'] as String));
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $numberOfTotalQuestions questions correctly!',
              style: GoogleFonts.lato(fontSize: 22, color: Colors.purple),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              icon: Icon(Icons.refresh),
              label: Text('Restart Quiz'),
              onPressed: () {
                restartQuiz();
              },
            ),
          ],
        ),
      ),
    );
  }
}
