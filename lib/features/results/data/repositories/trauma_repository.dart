import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/trauma_type_model.dart';

class TraumaRepository {
  Future<List<TraumaTypeModel>> getTraumaTypes() async {
    final String jsonString = await rootBundle.loadString('assets/types.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => TraumaTypeModel.fromJson(json)).toList();
  }
}
