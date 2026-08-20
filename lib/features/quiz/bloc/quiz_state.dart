import 'package:equatable/equatable.dart';
import '../../result/models/result_model.dart';
import '../models/question_model.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuestionModel> questions;
  final int currentQuestion;
  final int score;
  final String? selectedAnswer;
  final bool? isCorrect;

  const QuizLoaded({
    required this.questions,
    required this.currentQuestion,
    required this.score,
    this.selectedAnswer,
    this.isCorrect,
  });

  QuizLoaded copyWith({
    List<QuestionModel>? questions,
    int? currentQuestion,
    int? score,
    String? selectedAnswer,
    bool? isCorrect,
  }) {
    return QuizLoaded(
      questions: questions ?? this.questions,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      score: score ?? this.score,
      selectedAnswer: selectedAnswer,
      isCorrect: isCorrect,
    );
  }

  @override
  List<Object?> get props => [
    questions,
    currentQuestion,
    score,
    selectedAnswer,
    isCorrect,
  ];
}

class QuizFinished extends QuizState {
  final ResultModel result;

  const QuizFinished(this.result);

  @override
  List<Object?> get props => [result];
}
class QuizError extends QuizState {
  final String message;

  const QuizError(this.message);

  @override
  List<Object?> get props => [message];
}