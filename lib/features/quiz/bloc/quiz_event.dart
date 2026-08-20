import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class GetQuestions extends QuizEvent {
  final String category;

  const GetQuestions(this.category);

  @override
  List<Object?> get props => [category];
}

class SelectAnswer extends QuizEvent {
  final String answer;

  const SelectAnswer(this.answer);

  @override
  List<Object?> get props => [answer];
}

class NextQuestion extends QuizEvent {
  final String category;

  const NextQuestion(this.category);

  @override
  List<Object?> get props => [category];
}