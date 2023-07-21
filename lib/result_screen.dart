import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onSelectAnswer,required this.onRestart});
  final void Function(String answer) onSelectAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> get getData {
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
    final summaryData = getData;
    final numOfQuestions = questions.length;

    // comparing number of  answered questions to number of total questions
    final numOfCorrectAnswers = getData
        .where(
          (element) => element['user_answer'] == element['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              ' you answered $numOfCorrectAnswers out $numOfQuestions questions correctly',
              style: GoogleFonts.lato  (
                  color: const  Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            QuestionsData(
              summaryData: summaryData,
            ),
            const SizedBox(height: 30),
            TextButton.icon(
                onPressed: onRestart,
                label: const Text(
                  'Restart quiz',
                style: TextStyle(fontSize: 15),
                ),
                icon: const Icon(Icons.restart_alt),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
