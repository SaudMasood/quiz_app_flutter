import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/database/database_helper.dart';

import '../models/question_model.dart';
import '../../result/models/result_model.dart';

import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final DatabaseHelper databaseHelper;

  QuizBloc(this.databaseHelper) : super(QuizInitial()) {

    on<GetQuestions>((event, emit) async {
      emit(QuizLoading());

      try {
        await databaseHelper.createDatabase();

        final data = await databaseHelper.getQuestions(
          event.category,
        );

        final questions = data
            .map(
              (question) => QuestionModel.fromMap(question),
        )
            .toList();

        if (questions.isEmpty) {
          emit(
            QuizError(
              'No questions found',
            ),
          );

          return;
        }

        emit(
          QuizLoaded(
            questions: questions,
            currentQuestion: 0,
            score: 0,
          ),
        );
      } catch (e) {
        emit(
          QuizError(
            e.toString(),
          ),
        );
      }
    });

    on<SelectAnswer>((event, emit) {
      if (state is! QuizLoaded) return;

      final currentState = state as QuizLoaded;

      final question = currentState.questions[
      currentState.currentQuestion
      ];

      final correct =
          event.answer == question.correctAnswer;

      emit(
        currentState.copyWith(
          selectedAnswer: event.answer,
          isCorrect: correct,
          score: correct
              ? currentState.score + 1
              : currentState.score,
        ),
      );
    });

    on<NextQuestion>((event, emit) async {
      if (state is! QuizLoaded) return;

      final currentState = state as QuizLoaded;

      if (currentState.currentQuestion <
          currentState.questions.length - 1) {

        emit(
          currentState.copyWith(
            currentQuestion:
            currentState.currentQuestion + 1,
            selectedAnswer: null,
            isCorrect: null,
          ),
        );
      } else {

        final result = ResultModel(
          id: 0,
          category: event.category,
          score: currentState.score,
          totalQuestions: currentState.questions.length,
        );

        await databaseHelper.insertResult(
          result.category,
          result.score,
          result.totalQuestions,
        );

        emit(
          QuizFinished(result),
        );
      }
    });
  }
}