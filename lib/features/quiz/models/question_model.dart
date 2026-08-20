class QuestionModel {
  final int id;
  final String category;
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String correctAnswer;

  QuestionModel({
    required this.id,
    required this.category,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctAnswer,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'],
      category: map['category'],
      question: map['question'],
      optionA: map['optionA'],
      optionB: map['optionB'],
      optionC: map['optionC'],
      optionD: map['optionD'],
      correctAnswer: map['correctAnswer'],
    );
  }
}