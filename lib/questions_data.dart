import 'package:flutter/material.dart';

class QuestionsData extends StatelessWidget {
  const QuestionsData({
    super.key,
    required this.summaryData,
  });

  final Color color = const Color.fromARGB(220, 255, 255, 255);
  final List<Map<String, Object>> summaryData;

  Widget text(String text, Color color, FontWeight fontWeight, double fontSize){
    return Text(text, style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize));
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            var dt = data['user_answer'] == data['correct_answer'];
          
            return Row(
              children: [
                CircleAvatar(
                  backgroundColor: dt
                      ? Colors.blue.shade800
                      : Colors.red.shade800,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ),
                const SizedBox(width: 35),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      text(data['question'].toString(), color, FontWeight.bold,15),
                      const SizedBox(
                        height: 5,
                      ),
                      text(
                        "Chosen Answer:\t\t ${data['user_answer'].toString()}",
                        const Color.fromARGB(255, 247, 127, 167),
                        FontWeight.normal,14
                      ),
                      const SizedBox(height: 5,),
                      text(
                        "Correct Answer: \t\t${data['correct_answer'].toString()}",
                        const Color.fromARGB(255, 228, 134, 245),
                        FontWeight.normal,14
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
