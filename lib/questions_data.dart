import 'package:flutter/material.dart';

class QuestionsData extends StatelessWidget {
  const QuestionsData({super.key, required this.summaryData,});
   
   final Color color = const Color.fromARGB(220, 255, 255, 255);
  final List<Map<String, Object>> summaryData;
  

  Widget text(String text, Color color) {
    return Text(text,style: TextStyle(color: color,));
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
                    backgroundColor: data['user_answer'] == data['correct_answer'] 
                    ? Colors.blue
                    :Colors.red,
                    child: Text(((data['question_index']as int) + 1).toString(),
                     style:  TextStyle(
                      color: color, 
                     ),
                    ) ,
                  ),
                  const SizedBox(width:35),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const  SizedBox(height: 30),
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
