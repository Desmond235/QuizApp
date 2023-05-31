class QuizQuestions {
  final String text;
  final List<String> answer;

  const QuizQuestions({
    required this.text,
    required this.answer,
  });

  List<String> getShuffledListAnswers() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
