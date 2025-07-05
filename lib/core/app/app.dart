import 'package:flutter/material.dart';
import '../../features/questions/presentation/screens/questions_screen.dart';

class ImpostorSyndromeApp extends StatelessWidget {
  const ImpostorSyndromeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const QuestionsScreen(),
    );
  }
}
