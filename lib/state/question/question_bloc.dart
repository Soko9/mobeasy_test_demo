import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mobeasy_test_demo/models/question.dart";

part "question_event.dart";
part "question_state.dart";

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(const QuestionInitial()) {
    on<QuestionAnswerEvent>(_onAnswer);
    on<QuestionClearEvent>(_onClear);
  }

  void _onAnswer(QuestionAnswerEvent event, Emitter emit) async {
    // answering question then passing true or flase to the state
    await Future.delayed(const Duration(milliseconds: 500), () {
      emit(
        QuestionAnswered(
          isCorrect: _checkAnswer(
            question: event.question,
            answer: event.answer,
          ),
        ),
      );
    });
  }

  void _onClear(QuestionClearEvent event, Emitter emit) async {
    await Future.delayed(const Duration(milliseconds: 150), () {
      emit(const QuestionInitial());
    });
  }

  bool _checkAnswer({
    required Question question,
    required String answer,
  }) =>
      question.answer == answer;
}
