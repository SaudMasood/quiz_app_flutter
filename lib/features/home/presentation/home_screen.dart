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
      'title': 'Dart Quiz',
      'category': 'Dart',
      'subtitle': '10 Questions',
      'icon': Icons.code,
    },
    {
      'title': 'Web Development Quiz',
      'category': 'Web Development',
      'subtitle': '10 Questions',
      'icon': Icons.web,
    },
    {
      'title': 'Database Quiz',
      'category': 'Database',
      'subtitle': '10 Questions',
      'icon': Icons.storage,
    },
    {
      'title': 'Programming Quiz',
      'category': 'Programming',
      'subtitle': '10 Questions',
      'icon': Icons.computer,
    },
    {
      'title': 'Computer Science Quiz',
      'category': 'Computer Science',
      'subtitle': '10 Questions',
      'icon': Icons.school,
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
      'Dart',
      'Which keyword is used to create a variable in Dart?',
      'var',
      'variable',
      'let',
      'define',
      'var',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which keyword creates a value that cannot be changed?',
      'var',
      'final',
      'dynamic',
      'late',
      'final',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which keyword is used for compile-time constants?',
      'final',
      'var',
      'const',
      'static',
      'const',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which symbol is used for nullable variables?',
      '!',
      '?',
      '#',
      '&',
      '?',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which collection stores ordered values?',
      'Map',
      'Set',
      'List',
      'Object',
      'List',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which collection stores key-value pairs?',
      'List',
      'Set',
      'Map',
      'Array',
      'Map',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which keyword defines a class?',
      'object',
      'class',
      'model',
      'type',
      'class',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which keyword is used to return a value from a function?',
      'send',
      'return',
      'output',
      'value',
      'return',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which operator is used for null-aware access?',
      '?.',
      '!!',
      '::',
      '??',
      '?.',
    );

    await databaseHelper.insertQuestion(
      'Dart',
      'Which keyword is used to handle exceptions?',
      'check',
      'try',
      'catch-only',
      'error',
      'try',
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

    await databaseHelper.insertQuestion(
      'Database',
      'What does SQL stand for?',
      'Structured Query Language',
      'Simple Query Language',
      'System Query Language',
      'Standard Question Language',
      'Structured Query Language',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'Which command is used to retrieve data?',
      'INSERT',
      'UPDATE',
      'SELECT',
      'DELETE',
      'SELECT',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'Which command adds new data?',
      'INSERT',
      'SELECT',
      'DELETE',
      'DROP',
      'INSERT',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'Which command modifies existing data?',
      'CHANGE',
      'UPDATE',
      'MODIFY',
      'EDIT',
      'UPDATE',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'Which command removes data?',
      'REMOVE',
      'CLEAR',
      'DELETE',
      'DROP',
      'DELETE',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'What uniquely identifies a row?',
      'Foreign Key',
      'Primary Key',
      'Index',
      'Column',
      'Primary Key',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'Which database is used by your Flutter quiz app?',
      'MongoDB',
      'MySQL',
      'SQLite',
      'Oracle',
      'SQLite',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'What does CRUD stand for?',
      'Create Read Update Delete',
      'Create Run Update Data',
      'Copy Read Update Delete',
      'Create Remove Use Data',
      'Create Read Update Delete',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'Which SQL command creates a table?',
      'MAKE TABLE',
      'CREATE TABLE',
      'NEW TABLE',
      'ADD TABLE',
      'CREATE TABLE',
    );

    await databaseHelper.insertQuestion(
      'Database',
      'Which SQL command is used to remove a table?',
      'DELETE TABLE',
      'REMOVE TABLE',
      'DROP TABLE',
      'CLEAR TABLE',
      'DROP TABLE',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'What is a variable?',
      'A storage location for data',
      'A computer',
      'A database',
      'An operating system',
      'A storage location for data',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'What does OOP stand for?',
      'Object Oriented Programming',
      'Object Operating Program',
      'Online Object Programming',
      'Open Oriented Process',
      'Object Oriented Programming',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'Which concept hides internal implementation details?',
      'Inheritance',
      'Encapsulation',
      'Polymorphism',
      'Looping',
      'Encapsulation',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'Which concept allows a class to use another class properties?',
      'Inheritance',
      'Encapsulation',
      'Abstraction',
      'Iteration',
      'Inheritance',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'Which structure repeats code?',
      'Variable',
      'Loop',
      'Class',
      'Object',
      'Loop',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'Which loop checks its condition before execution?',
      'do-while',
      'while',
      'repeat',
      'foreach-only',
      'while',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'What is a function?',
      'A reusable block of code',
      'A database',
      'A variable only',
      'An operating system',
      'A reusable block of code',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'What is debugging?',
      'Writing documentation',
      'Finding and fixing errors',
      'Creating a database',
      'Installing software',
      'Finding and fixing errors',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'What does API stand for?',
      'Application Programming Interface',
      'Application Program Internet',
      'Advanced Programming Input',
      'Application Process Interface',
      'Application Programming Interface',
    );

    await databaseHelper.insertQuestion(
      'Programming',
      'What is an algorithm?',
      'A step-by-step solution',
      'A programming language',
      'A database',
      'A computer',
      'A step-by-step solution',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'What does CPU stand for?',
      'Central Processing Unit',
      'Computer Personal Unit',
      'Central Program Utility',
      'Computer Processing User',
      'Central Processing Unit',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'What does RAM stand for?',
      'Random Access Memory',
      'Read Access Memory',
      'Rapid Application Memory',
      'Random Application Module',
      'Random Access Memory',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'Which is an operating system?',
      'Flutter',
      'Windows',
      'Dart',
      'HTML',
      'Windows',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'Which device is used to input text?',
      'Monitor',
      'Printer',
      'Keyboard',
      'Speaker',
      'Keyboard',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'Which device displays visual output?',
      'Keyboard',
      'Mouse',
      'Monitor',
      'Microphone',
      'Monitor',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'What does URL stand for?',
      'Uniform Resource Locator',
      'Universal Resource Link',
      'User Resource Locator',
      'Uniform Reference Link',
      'Uniform Resource Locator',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'What does HTTP stand for?',
      'HyperText Transfer Protocol',
      'High Transfer Text Protocol',
      'Hyper Tool Transfer Process',
      'Home Text Transfer Protocol',
      'HyperText Transfer Protocol',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'Which number system uses only 0 and 1?',
      'Decimal',
      'Binary',
      'Hexadecimal',
      'Octal',
      'Binary',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'Which data structure follows FIFO?',
      'Stack',
      'Queue',
      'Tree',
      'Graph',
      'Queue',
    );

    await databaseHelper.insertQuestion(
      'Computer Science',
      'Which data structure follows LIFO?',
      'Queue',
      'Array',
      'Stack',
      'Graph',
      'Stack',
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
            // SizedBox(height: 14),
              Flexible(
                child: Image.asset('assets/images/home.png'
                ,
                height: 150,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),

            Text(
              'Take a Quiz',
              style: AppTextStyles.heading,
            ),

            const SizedBox(height: 20),

            Expanded(
              flex: 3,

              child: ListView.builder(
                itemCount: categories.length,

                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),

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