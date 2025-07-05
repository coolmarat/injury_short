class TraumaTypeModel {
  final String type;
  final String description;
  
  TraumaTypeModel({required this.type, required this.description});
  
  factory TraumaTypeModel.fromJson(Map<String, dynamic> json) {
    return TraumaTypeModel(
      type: json['type'] as String,
      description: json['description'] as String,
    );
  }
}
