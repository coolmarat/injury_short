class QuestionModel {
  final String question;
  final String type;
  
  QuestionModel({required this.question, required this.type});
  
  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'] as String,
      type: json['type'] as String,
    );
  }
  
  Map<String, dynamic> toJson() => {
    'question': question,
    'type': type,
  };
}
