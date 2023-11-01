class Question {
  final String question;
  final List<String> options;
  final String answer;

  const Question({
    required this.question,
    required this.options,
    required this.answer,
  });

  static const List<Question> questions = [
    Question(
      question: "1 + 1",
      options: ["1", "3", "2", "0"],
      answer: "2",
    ),
    Question(
      question: "2 + 2",
      options: ["11", "-3", "2", "4"],
      answer: "4",
    ),
    Question(
      question: "3 + 3",
      options: ["6", "0", "3", "5"],
      answer: "6",
    ),
  ];
}
