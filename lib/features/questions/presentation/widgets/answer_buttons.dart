import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget {
  final Function(bool) onAnswer;
  
  const AnswerButtons({super.key, required this.onAnswer});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => onAnswer(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[100],
              ),
              child: const Text('Да'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () => onAnswer(false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[50],
              ),
              child: const Text('Нет'),
            ),
          ),
        ],
      ),
    );
  }
}
