import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/app_text_styles.dart';
import 'package:quiz_app/core/widgets/app_bar.dart';
import 'package:quiz_app/features/home/presentation/home_screen.dart';
import 'package:quiz_app/features/main/main_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();

    Timer(Duration(seconds: 3),(){
      if(!mounted) return ;
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)
      => MainScreen())
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: " abc"),
      body: Center(
        child: Text(
          'Quiz App',
          style: AppTextStyles.heading,
        ),

      ),
    );
  }
}
