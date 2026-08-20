class ResultModel {
  final int id;
  final String category;
  final int score;
  final int totalQuestions;

  ResultModel({
    required this.id,
    required this.category,
    required this.score,
    required this.totalQuestions,
  });

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      id: map['id'],
      category: map['category'],
      score: map['score'],
      totalQuestions: map['totalQuestions'],
    );
  }
}