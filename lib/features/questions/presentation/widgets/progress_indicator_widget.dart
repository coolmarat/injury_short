import 'package:flutter/material.dart';

class QuestionProgressIndicator extends StatelessWidget {
  final int current;
  final int total;
  
  const QuestionProgressIndicator({
    super.key, 
    required this.current, 
    required this.total
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: current / total,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            minHeight: 10,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
