import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database db;

  Future<void> createDatabase() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'quiz_app.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE questions ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'category TEXT, '
              'question TEXT, '
              'optionA TEXT, '
              'optionB TEXT, '
              'optionC TEXT, '
              'optionD TEXT, '
              'correctAnswer TEXT)',
        );

        await db.execute(
          'CREATE TABLE results ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'category TEXT, '
              'score INTEGER, '
              'totalQuestions INTEGER)',
        );
      },
    );
  }

  // Insert Question
  Future<void> insertQuestion(
      String category,
      String question,
      String optionA,
      String optionB,
      String optionC,
      String optionD,
      String correctAnswer,
      ) async {
    await db.insert(
      'questions',
      {
        'category': category,
        'question': question,
        'optionA': optionA,
        'optionB': optionB,
        'optionC': optionC,
        'optionD': optionD,
        'correctAnswer': correctAnswer,
      },
    );
  }

  // Get Questions by Category
  Future<List<Map<String, dynamic>>> getQuestions(
      String category,
      ) async {
    return await db.query(
      'questions',
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  // Save Quiz Result
  Future<void> insertResult(
      String category,
      int score,
      int totalQuestions,
      ) async {
    await db.insert(
      'results',
      {
        'category': category,
        'score': score,
        'totalQuestions': totalQuestions,
      },
    );
  }

  // Get Quiz History
  Future<List<Map<String, dynamic>>> getResults() async {
    return await db.query(
      'results',
      orderBy: 'id DESC',
    );
  }

  Future<bool> questionsExist() async {
    final result = await db.query(
      'questions',
      limit: 1,
    );

    return result.isNotEmpty;
  }
}