import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_data.dart';

class ResultScreen extends StatefulWidget {
  final List<String> chosenAnswers;
  const ResultScreen({super.key, required this.chosenAnswers});


  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
   List<Map<String, Object>> data = [];
  List<Map<String, Object>> get getData {
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

  bool get getCorrectAnswer{
     bool  correctAnswer = false;
    data.where((element){
        if(element['user_answer'] == element['correct_answer']){
          setState(() {
            correctAnswer = true;
          });  
      }
      else{
        setState(() {
          correctAnswer = false;
        });
      }
      return correctAnswer;
    } 
    );
     return correctAnswer;
  }

  
  @override
  Widget build(BuildContext context) {
    final summaryData = getData;
    final numOfQuestions = questions.length;

    // comparing number of  answered questions to number of total questions
    final numOfCorrectAnswers = getData.where(
      (element) => element['user_answer'] == element['correct_answer'],
    );

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ' you answered ${numOfCorrectAnswers.length} out $numOfQuestions questions correctly',
              style: const TextStyle(
                color: Color.fromARGB(220, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 20),
            QuestionsData(
              summaryData: summaryData,
              correctQuestion: getCorrectAnswer,
            ),
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
