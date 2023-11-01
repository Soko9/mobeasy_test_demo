import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mobeasy_test_demo/models/question.dart";
import "package:mobeasy_test_demo/state/question/question_bloc.dart";
import "package:mobeasy_test_demo/views/question_widget.dart";

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(
            controller: pageController,
            pageSnapping: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => QuestionWidget(
              index: index,
              question: Question.questions[index],
              onAnswer: (answer) async {
                BlocProvider.of<QuestionBloc>(context).add(
                  QuestionAnswerEvent(
                    question: Question.questions[index],
                    answer: answer,
                  ),
                );
              },
              onNext: () {
                BlocProvider.of<QuestionBloc>(context).add(
                  const QuestionClearEvent(),
                );
                if (index < Question.questions.length - 1) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 450),
                    curve: Curves.fastOutSlowIn,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Container(color: Colors.blue),
                    ),
                  );
                }
              },
            ),
            itemCount: Question.questions.length,
          ),
        ),
      ),
    );
  }
}
