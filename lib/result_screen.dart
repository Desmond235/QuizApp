import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getData() {
    List<Map<String, Object>> data = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      data.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answer[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           QuestionsData(summaryData: getData()),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const Text('Restart quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
