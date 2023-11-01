part of "question_bloc.dart";

@immutable
sealed class QuestionEvent {
  const QuestionEvent();
}

class QuestionAnswerEvent extends QuestionEvent {
  final Question question;
  final String answer;
  const QuestionAnswerEvent({required this.question, required this.answer});
}

class QuestionClearEvent extends QuestionEvent {
  const QuestionClearEvent();
}
