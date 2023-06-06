import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final VoidCallback onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          )),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(),
      ),
    );
  }
}
