import 'package:flutter/material.dart';

class QuestionDisplay extends StatelessWidget {
  final String question;
  
  const QuestionDisplay({super.key, required this.question});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
