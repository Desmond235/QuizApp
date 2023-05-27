import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/quiz_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
    Widget ? activeScreen;

   // ignore: unused_element
   void switchScreen() {
    setState(() {
      activeScreen = const QuizScreen();
    });
   }

   @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(10),
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
        child: activeScreen
      ),
    );
  }
}
