class QuestionRequest {
  final String question;
  final String description;

  QuestionRequest({
    required this.question,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'description': description,
    };
  }
}
