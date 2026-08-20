import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/app_text_styles.dart';
import 'package:quiz_app/core/widgets/app_bar.dart';
import 'package:quiz_app/features/main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
          () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz App',
              style: AppTextStyles.heading,
            ),

            const SizedBox(height: 15),

            Flexible(
              child: Image.asset('assets/images/logo.png',
              height: 280,
                width: 280,
                fit: BoxFit.cover,

              ),
            )
          ],
        ),
      ),
    );
  }
}