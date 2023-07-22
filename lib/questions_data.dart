import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsData extends StatelessWidget {
  const QuestionsData({
    super.key,
    required this.summaryData,
  });

  final Color color = const Color.fromARGB(220, 255, 255, 255);
  final List<Map<String, Object>> summaryData;

  Widget text(
    String text,
    Color color,
    FontWeight fontWeight,
    double fontSize,
  ) {
    return Text(text,
        style: GoogleFonts.lato(
            color: color, fontWeight: fontWeight, fontSize: fontSize));
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            var dt = data['user_answer'] == data['correct_answer'];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: dt
                            ? const Color.fromARGB(255, 150, 198, 241)
                            : const Color.fromARGB(255, 249, 133, 241),
                        borderRadius: BorderRadius.circular(80)),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 22, 2, 56),
                      ),
                    ),
                  ),
                  const SizedBox(width: 35),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(data['question'].toString(), color,
                            FontWeight.bold, 15),
                        const SizedBox(
                          height: 5,
                        ),
                        text(
                            "Chosen Answer:\t\t ${data['user_answer'].toString()}",
                            const Color.fromARGB(255, 255, 168, 249),
                            FontWeight.normal,
                            14),
                        const SizedBox(
                          height: 5,
                        ),
                        text(
                            "Correct Answer: \t\t${data['correct_answer'].toString()}",
                            const Color.fromARGB(255, 181, 254, 245),
                            FontWeight.normal,
                            14),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
