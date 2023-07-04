import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
// selected answers
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';
  bool isLoading = false;

  // ignore: unused_element
  void switchScreen() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

// function for selected answers
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        selectedAnswer = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen, isLoading);

    if (activeScreen == 'quiz-screen') {
      screen = QuizScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screen = ResultScreen(chosenAnswers:  selectedAnswer);
    }
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 141)
            ],
          ),
        ),
        child: screen,
      ),
    );
  }
}
