import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final VoidCallback onPressed;
  
  const RestartButton({super.key, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Вернуться'),
      ),
    );
  }
}
