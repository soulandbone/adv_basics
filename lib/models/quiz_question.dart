class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> shuffleQuestions() {
    final shuffledAnswersList = List.of(answers);
    shuffledAnswersList.shuffle();
    return shuffledAnswersList;
  }
}
