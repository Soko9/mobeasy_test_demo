import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mobeasy_test_demo/state/question/question_bloc.dart";
import "package:mobeasy_test_demo/views/question_screen.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuestionBloc>(create: (_) => QuestionBloc()),
      ],
      child: MaterialApp(
        title: "Mobeasy Test Demo",
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const QuestionScreen(),
      ),
    );
  }
}
