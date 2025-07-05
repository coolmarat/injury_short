import 'package:flutter/material.dart';

import '../../data/models/trauma_type_model.dart';

class TraumaDescriptions extends StatelessWidget {
  final Map<String, int> answers;
  final List<TraumaTypeModel> traumaTypes;

  const TraumaDescriptions(
      {super.key, required this.answers, required this.traumaTypes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...traumaTypes.map((type) => Text(
                '${type.type}: ${type.description}: ${answers[type.type] ?? 0}',
                style: const TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }
}
