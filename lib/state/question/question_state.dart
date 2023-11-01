part of "question_bloc.dart";

@immutable
sealed class QuestionState {
  const QuestionState();
}

class QuestionInitial extends QuestionState {
  const QuestionInitial();
}

class QuestionAnswered extends QuestionState {
  final bool isCorrect;
  const QuestionAnswered({required this.isCorrect});
}
