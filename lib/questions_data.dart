import 'package:flutter/material.dart';

class QuestionsData extends StatelessWidget {
  const QuestionsData({super.key, required this.summaryData});
   
   final Color color = const Color.fromARGB(220, 255, 255, 255);
  final List<Map<String, Object>> summaryData;
  Widget text(String text, Color color) {
    return Text(text,style: TextStyle(color: color));
  }

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            text(
              ((data['question_index'] as int) + 1).toString(),
              color
            ),
            Column(
              children: [
                text(data['question'].toString(),color),
                const SizedBox(
                  height: 5,
                ),
                text(data['user_answer'].toString(),color),
                text(data['correct_answer'].toString(),color),
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}
