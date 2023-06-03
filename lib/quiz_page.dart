import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/quiz_screen.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var activeScreen = 'start-screen';
  bool isLoading = false;

  // ignore: unused_element
  void switchScreen() async {
    setState((){
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));
    setState((){
      isLoading = false;
    });
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen, isLoading);

    if(activeScreen == 'quiz-screen'){
      screen = const QuizScreen();
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
