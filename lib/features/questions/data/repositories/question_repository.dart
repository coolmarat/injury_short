import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../models/question_model.dart';

class QuestionRepository {
  Future<List<QuestionModel>> getQuestions() async {
    final String jsonString = await rootBundle.loadString('assets/questions.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    final List<QuestionModel> questions = jsonData.map((json) => QuestionModel.fromJson(json)).toList();
    
    // Shuffle the questions randomly
    questions.shuffle(Random());
    
    return questions;
  }
}
