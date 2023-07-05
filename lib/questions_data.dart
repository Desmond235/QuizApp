import 'package:flutter/material.dart';

class QuestionsData extends StatelessWidget {
  const QuestionsData({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  Widget text(String text) {
    return Text(text);
  }

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            text(
              ((data['question_index'] as int) + 1).toString(),
            ),
            Column(
              children: [
                text(data['question'].toString()),
                const SizedBox(
                  height: 5,
                ),
                text(data['user_answer'].toString()),
                text(data['correct_answer'].toString()),
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}
