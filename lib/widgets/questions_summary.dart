import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              summaryData.map((e) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor:
                            (e['correct_answer'] as String) ==
                                    (e['user_answer'] as String)
                                ? Colors.green
                                : Colors.red,
                      ),
                      onPressed: () {},
                      child: Text(
                        (e['question_index'] as int).toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            (e['question_text']) as String,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 15),
                          Text(
                            (e['user_answer']) as String,
                            style: TextStyle(color: Colors.purple),
                          ),
                          Text((e['correct_answer']) as String),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
