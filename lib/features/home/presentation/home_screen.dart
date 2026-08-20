import 'package:flutter/material.dart';
import 'package:quiz_app/core/database/database_helper.dart';
import 'package:quiz_app/core/utils/app_text_styles.dart';
import 'package:quiz_app/core/widgets/app_bar.dart';
import 'package:quiz_app/features/home/presentation/widgets/quiz_category_card.dart';
import 'package:quiz_app/features/quiz/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Flutter Quiz',
      'category': 'Flutter',
      'subtitle': '10 Questions',
      'icon': Icons.flutter_dash,
    },
    {
      'title': 'Math Quiz',
      'category': 'Math',
      'subtitle': '10 Questions',
      'icon': Icons.calculate,
    },
    {
      'title': 'Web Quiz',
      'category': 'Web Development',
      'subtitle': '10 Questions',
      'icon': Icons.web,
    },
  ];

  @override
  void initState() {
    super.initState();

    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    await databaseHelper.createDatabase();

    final exists = await databaseHelper.questionsExist();

    if (!exists) {
      await insertDefaultQuestions();
    }
  }

  Future<void> insertDefaultQuestions() async {
    await databaseHelper.insertQuestion(
      'Flutter',
      'What is Flutter?',
      'Database',
      'UI Framework',
      'Operating System',
      'Browser',
      'UI Framework',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which programming language is used by Flutter?',
      'Java',
      'Python',
      'Dart',
      'C++',
      'Dart',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which widget is used for a basic screen structure?',
      'Scaffold',
      'Container',
      'Text',
      'Row',
      'Scaffold',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which widget displays text?',
      'Image',
      'Text',
      'Column',
      'Icon',
      'Text',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which widget is used for a clickable button?',
      'Text',
      'Image',
      'ElevatedButton',
      'Container',
      'ElevatedButton',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which method is used to update StatefulWidget UI?',
      'build()',
      'setState()',
      'dispose()',
      'initState()',
      'setState()',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which widget arranges children vertically?',
      'Row',
      'Stack',
      'Column',
      'ListTile',
      'Column',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which widget arranges children horizontally?',
      'Column',
      'Row',
      'Stack',
      'Center',
      'Row',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which file contains Flutter project dependencies?',
      'main.dart',
      'pubspec.yaml',
      'index.html',
      'AndroidManifest.xml',
      'pubspec.yaml',
    );

    await databaseHelper.insertQuestion(
      'Flutter',
      'Which command runs a Flutter application?',
      'flutter start',
      'flutter run',
      'flutter open',
      'flutter launch',
      'flutter run',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 5 + 5?',
      '8',
      '9',
      '10',
      '11',
      '10',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 10 - 4?',
      '5',
      '6',
      '7',
      '8',
      '6',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 6 × 3?',
      '15',
      '18',
      '21',
      '24',
      '18',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 20 ÷ 4?',
      '4',
      '5',
      '6',
      '8',
      '5',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 7 + 8?',
      '13',
      '14',
      '15',
      '16',
      '15',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 12 - 7?',
      '4',
      '5',
      '6',
      '7',
      '5',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 9 × 2?',
      '16',
      '18',
      '20',
      '21',
      '18',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 36 ÷ 6?',
      '4',
      '5',
      '6',
      '7',
      '6',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is 10% of 100?',
      '5',
      '10',
      '15',
      '20',
      '10',
    );

    await databaseHelper.insertQuestion(
      'Math',
      'What is the square of 5?',
      '10',
      '15',
      '20',
      '25',
      '25',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'What does HTML stand for?',
      'Hyper Text Markup Language',
      'High Text Machine Language',
      'Hyper Tool Multi Language',
      'Home Text Markup Language',
      'Hyper Text Markup Language',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'What is CSS used for?',
      'Database management',
      'Styling web pages',
      'Server hosting',
      'Programming hardware',
      'Styling web pages',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'Which language is mainly used to add interactivity to web pages?',
      'HTML',
      'CSS',
      'JavaScript',
      'SQL',
      'JavaScript',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'Which HTML tag is used for a paragraph?',
      '<p>',
      '<h1>',
      '<div>',
      '<text>',
      '<p>',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'Which HTML tag is used to create a link?',
      '<link>',
      '<a>',
      '<url>',
      '<href>',
      '<a>',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'Which CSS property changes text color?',
      'font-size',
      'background',
      'color',
      'text-style',
      'color',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'What does URL stand for?',
      'Uniform Resource Locator',
      'Universal Resource Link',
      'User Resource Location',
      'Uniform Reference Link',
      'Uniform Resource Locator',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'Which language is used to query databases?',
      'HTML',
      'CSS',
      'SQL',
      'Dart',
      'SQL',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'Which technology is used to create the structure of a web page?',
      'HTML',
      'CSS',
      'SQL',
      'MongoDB',
      'HTML',
    );

    await databaseHelper.insertQuestion(
      'Web Development',
      'Which CSS property changes the background color?',
      'color',
      'background-color',
      'font-color',
      'background-text',
      'background-color',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Quiz App',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 30),

            Text(
              'Take a Quiz',
              style: AppTextStyles.heading,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: QuizCategoryCard(
                      title: category['title'],
                      subtitle: category['subtitle'],
                      icon: category['icon'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              category: category['category'],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}