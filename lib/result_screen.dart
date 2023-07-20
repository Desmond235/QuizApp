import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_data.dart';


class ResultScreen extends StatefulWidget {
  final List<String> chosenAnswers;
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onSelectAnswer,required this.resetQuiz});
  final void Function(String answer) onSelectAnswer;
  final void Function() resetQuiz;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
 

  List<Map<String, Object>> get getData {
    List<Map<String, Object>> data = [];
    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      data.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answer[0],
          'user_answer': widget.chosenAnswers[i]
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
              style: const TextStyle(
                  color: Color.fromARGB(220, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            QuestionsData(
              summaryData: summaryData,
            ),
            const SizedBox(height: 30),
            TextButton.icon(
                onPressed: widget.resetQuiz,
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
