import 'package:flutter/material.dart';
import 'package:quiz_app/core/database/database_helper.dart';
import 'package:quiz_app/core/widgets/app_bar.dart';
import 'package:quiz_app/features/quiz/models/question_model.dart';

import '../result/models/result_model.dart';
import '../result/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({
    super.key,
    required this.category,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  List<QuestionModel> questions = [];

  int currentQuestion = 0;
  int score = 0;

  String? selectedAnswer;
  bool? isCorrect;

  @override
  void initState() {
    super.initState();
    getQuestion();
  }

  Future<void> getQuestion() async {
    await databaseHelper.createDatabase();

    final data = await databaseHelper.getQuestions(
      widget.category,
    );

    questions = data
        .map(
          (question) => QuestionModel.fromMap(question),
    )
        .toList();

    setState(() {});
  }

  void checkAnswer(String answer) {
    final question = questions[currentQuestion];

    setState(() {
      selectedAnswer = answer;

      if (answer == question.correctAnswer) {
        isCorrect = true;
        score++;
      } else {
        isCorrect = false;
      }
    });
  }
  Future<void> nextQuestion() async {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        isCorrect = null;
      });
    } else {
      final result = ResultModel(
        id: 0,
        category: widget.category,
        score: score,
        totalQuestions: questions.length,
      );

      await databaseHelper.insertResult(
        result.category,
        result.score,
        result.totalQuestions,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            result: result,
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final question = questions[currentQuestion];

    return Scaffold(
      appBar: CustomAppBar(
        title: '${widget.category} Quiz',
        showBackButton: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestion + 1} of ${questions.length}',
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
              onPressed: selectedAnswer == null
                  ? () {
                checkAnswer(question.optionA);
              }
                  : null,
              child: Text(question.optionA),
            ),

            ElevatedButton(
              onPressed: selectedAnswer == null
                  ? () {
                checkAnswer(question.optionB);
              }
                  : null,
              child: Text(question.optionB),
            ),

            ElevatedButton(
              onPressed: selectedAnswer == null
                  ? () {
                checkAnswer(question.optionC);
              }
                  : null,
              child: Text(question.optionC),
            ),

            ElevatedButton(
              onPressed: selectedAnswer == null
                  ? () {
                checkAnswer(question.optionD);
              }
                  : null,
              child: Text(question.optionD),
            ),

            const SizedBox(height: 20),

            if (isCorrect != null)
              Text(
                isCorrect! ? 'Correct!' : 'Wrong!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isCorrect!
                      ? Colors.green
                      : Colors.red,
                ),
              ),

            const SizedBox(height: 20),

            if (selectedAnswer != null)
              ElevatedButton(
                onPressed: nextQuestion,
                child: Text(
                  currentQuestion == questions.length - 1
                      ? 'Finish'
                      : 'Next',
                ),
              ),
          ],
        ),
      ),
    );
  }
}