import 'package:flutter/material.dart';

class QuestionsData extends StatelessWidget {
  const QuestionsData({super.key, required this.summaryData,required this.correctQuestion});
   
   final Color color = const Color.fromARGB(220, 255, 255, 255);
  final List<Map<String, Object>> summaryData;
  final  bool correctQuestion;

  Widget text(String text, Color color) {
    return Text(text,style: TextStyle(color: color,));
  }

 Widget corrextText(Widget child ) {
    return SizedBox(child: child);
  }
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                   CircleAvatar(
                    child: Text(((data['question_index']as int) + 1).toString(),
                     style:  TextStyle(
                      color: color,
                      backgroundColor:  correctQuestion ? Colors.blue : Colors.red
                     ),
                    ) ,
                  ),
                Expanded(
                  child: Column(
                    children: [
                      text(data['question'].toString(),color),
                      const SizedBox(
                        height: 5,
                      ),
                      text(data['user_answer'].toString(),color),
                      text(data['correct_answer'].toString(),color),
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
