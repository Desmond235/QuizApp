class QuizQuestions {
  final String text;
  final List<String> answer;

  const QuizQuestions({
    required this.text,
    required this.answer,
  });
  // method to shuffle items for  answers
  List<String> getShuffledListAnswers() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
