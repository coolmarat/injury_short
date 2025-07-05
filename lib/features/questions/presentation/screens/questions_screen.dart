import 'package:flutter/material.dart';

import '../../../results/presentation/screens/results_screen.dart';
import '../../data/models/question_model.dart';
import '../../data/repositories/question_repository.dart';
import '../widgets/answer_buttons.dart';
import '../widgets/progress_indicator_widget.dart';
import '../widgets/question_display.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<QuestionModel> questions = [];
  Map<String, int> answers = {};
  int currentIndex = 0;
  final QuestionRepository _repository = QuestionRepository();

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final loadedQuestions = await _repository.getQuestions();
    setState(() {
      questions = loadedQuestions;
      for (var question in questions) {
        answers[question.type] = 0;
      }
    });
  }

  void answerQuestion(bool isYes) {
    if (isYes) {
      final String currentType = questions[currentIndex].type;
      setState(() {
        answers[currentType] = answers[currentType]! + 1;
      });
    }

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(answers: answers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Загрузка...')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Анкета')),
      body: Column(
        children: [
          QuestionDisplay(question: questions[currentIndex].question),
          AnswerButtons(onAnswer: answerQuestion),
          QuestionProgressIndicator(
            current: currentIndex + 1,
            total: questions.length,
          ),
        ],
      ),
    );
  }
}
