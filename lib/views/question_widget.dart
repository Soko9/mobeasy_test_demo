import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mobeasy_test_demo/models/question.dart";

import "../state/question/question_bloc.dart";

class QuestionWidget extends StatelessWidget {
  final int index;
  final Question question;
  final void Function(String) onAnswer;
  final VoidCallback onNext;

  const QuestionWidget({
    super.key,
    required this.index,
    required this.question,
    required this.onAnswer,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      width: size.width,
      height: size.height,
      color: theme.scaffoldBackgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              question.question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "sans-serif-condensed",
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: question.options
                    .map((option) => InkWell(
                          onTap: () {
                            onAnswer(option);
                          },
                          child: _option(
                            option,
                            question.answer,
                            theme,
                            size,
                          ),
                        ))
                    .toList(),
              ),
            ),
            ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: theme.colorScheme.primaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 64.0,
                ),
              ),
              child: Text(
                index < Question.questions.length - 1 ? "Next" : "Finish",
                style: const TextStyle(
                  fontFamily: "sans-serif-condensed",
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _option(
    String option,
    String answer,
    ThemeData theme,
    Size size,
  ) =>
      BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          return Container(
            width: size.width * 0.3,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              color: state is QuestionAnswered
                  ? option == answer
                      ? Colors.green.shade300
                      : Colors.red.shade200
                  : theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: Text(
                option,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "sans-serif-condensed",
                  fontSize: 32.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      );
}
