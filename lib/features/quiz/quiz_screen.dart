import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiz_app/core/database/database_helper.dart';
import 'package:quiz_app/core/widgets/app_bar.dart';

import 'bloc/quiz_bloc.dart';
import 'bloc/quiz_event.dart';
import 'bloc/quiz_state.dart';

import '../result/result_screen.dart';

class QuizScreen extends StatelessWidget {
  final String category;

  const QuizScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(
        DatabaseHelper(),
      )..add(
        GetQuestions(category),
      ),

      child: Scaffold(
        appBar: CustomAppBar(
          title: '$category Quiz',
          showBackButton: true,
        ),

        body: BlocConsumer<QuizBloc, QuizState>(
          listener: (context, state) {

            if (state is QuizFinished) {

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    result: state.result,
                  ),
                ),
              );
            }
          },

          builder: (context, state) {

            if (state is QuizLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is QuizError) {
              return Center(
                child: Text(
                  state.message,
                ),
              );
            }

            if (state is QuizLoaded) {

              final question =
              state.questions[state.currentQuestion];

              return Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      'Question '
                          '${state.currentQuestion + 1} '
                          'of '
                          '${state.questions.length}',

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Text(
                      question.question,

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed:
                      state.selectedAnswer == null
                          ? () {
                        context
                            .read<QuizBloc>()
                            .add(
                          SelectAnswer(
                            question.optionA,
                          ),
                        );
                      }
                          : null,

                      child: Text(
                        question.optionA,
                      ),
                    ),

                    ElevatedButton(
                      onPressed:
                      state.selectedAnswer == null
                          ? () {
                        context
                            .read<QuizBloc>()
                            .add(
                          SelectAnswer(
                            question.optionB,
                          ),
                        );
                      }
                          : null,

                      child: Text(
                        question.optionB,
                      ),
                    ),

                    ElevatedButton(
                      onPressed:
                      state.selectedAnswer == null
                          ? () {
                        context
                            .read<QuizBloc>()
                            .add(
                          SelectAnswer(
                            question.optionC,
                          ),
                        );
                      }
                          : null,

                      child: Text(
                        question.optionC,
                      ),
                    ),

                    ElevatedButton(
                      onPressed:
                      state.selectedAnswer == null
                          ? () {
                        context
                            .read<QuizBloc>()
                            .add(
                          SelectAnswer(
                            question.optionD,
                          ),
                        );
                      }
                          : null,

                      child: Text(
                        question.optionD,
                      ),
                    ),

                    const SizedBox(height: 20),

                    if (state.isCorrect != null)
                      Text(
                        state.isCorrect!
                            ? 'Correct!'
                            : 'Wrong!',

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: state.isCorrect!
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),

                    const SizedBox(height: 20),

                    if (state.selectedAnswer != null)
                      ElevatedButton(
                        onPressed: () {

                          context
                              .read<QuizBloc>()
                              .add(
                            NextQuestion(category),
                          );
                        },

                        child: Text(
                          state.currentQuestion ==
                              state.questions.length - 1
                              ? 'Finish'
                              : 'Next',
                        ),
                      ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}