import 'package:flutter/material.dart';
import '../widgets/results_chart.dart';
import '../widgets/trauma_descriptions.dart';
import '../widgets/restart_button.dart';
import '../../data/repositories/trauma_repository.dart';
import '../../data/models/trauma_type_model.dart';
import '../../../questions/presentation/screens/questions_screen.dart';

class ResultsScreen extends StatefulWidget {
  final Map<String, int> answers;
  
  const ResultsScreen({super.key, required this.answers});
  
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<TraumaTypeModel> traumaTypes = [];
  final TraumaRepository _repository = TraumaRepository();
  
  @override
  void initState() {
    super.initState();
    loadTraumaTypes();
  }
  
  Future<void> loadTraumaTypes() async {
    final loadedTypes = await _repository.getTraumaTypes();
    setState(() {
      traumaTypes = loadedTypes;
    });
  }
  
  void restartQuiz() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const QuestionsScreen(),
      ),
      (route) => false,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Результаты')),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: traumaTypes.isEmpty 
                ? const Center(child: CircularProgressIndicator())
                : ResultsChart(
                    answers: widget.answers,
                    traumaTypes: traumaTypes,
                  ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (traumaTypes.isNotEmpty)
                    Expanded(
                      child: TraumaDescriptions(
                        answers: widget.answers,
                        traumaTypes: traumaTypes,
                      ),
                    ),
                  RestartButton(onPressed: restartQuiz),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
