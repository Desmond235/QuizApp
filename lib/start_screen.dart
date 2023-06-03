import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, this.isLoading, {super.key});
  final VoidCallback startQuiz;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.white.withOpacity(0.65),
          ),
          const SizedBox(height: 70),
           Text(
            "Learn flutter the fun way!",
            style: GoogleFonts.sanchez(
              color: const Color.fromARGB(255, 248, 189, 238),
              fontSize: 23,
              
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: 
            (isLoading) 
            ?  Container(
              padding: const EdgeInsets.symmetric(vertical:8),
              child: const CircularProgressIndicator(
                color:Colors.white,
                strokeWidth: 1.8,

              ),
            )
            :const Text(
              "Start Quiz",
            ),
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
