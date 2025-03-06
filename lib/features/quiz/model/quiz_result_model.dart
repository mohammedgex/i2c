import 'dart:convert';

class QuizResult {
  final String status;
  final QuizData data;

  QuizResult({required this.status, required this.data});

  factory QuizResult.fromJson(Map<String, dynamic> json) {
    return QuizResult(
      status: json['status'],
      data: QuizData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class QuizData {
  final int userId;
  final int quizId;
  final Map<String, AnswerData> result;
  final int userGrade;
  final String status;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  QuizData({
    required this.userId,
    required this.quizId,
    required this.result,
    required this.userGrade,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) {
    // Parse the 'result' field from a JSON string to a Map
    Map<String, dynamic> resultMap = jsonDecode(json['result']);
    Map<String, AnswerData> parsedResult = resultMap.map(
      (key, value) => MapEntry(key, AnswerData.fromJson(value)),
    );

    return QuizData(
      userId: json['user_id'],
      quizId: json['quiz_id'],
      result: parsedResult,
      userGrade: json['user_grade'],
      status: json['status'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'quiz_id': quizId,
      'result': jsonEncode(result.map((key, value) => MapEntry(key, value.toJson()))),
      'user_grade': userGrade,
      'status': status,
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'id': id,
    };
  }
}
class AnswerData {
  final int answer; // The ID of the selected answer
  final bool correct; // Whether the selected answer is correct

  AnswerData({required this.answer, required this.correct});

  factory AnswerData.fromJson(Map<String, dynamic> json) {
    return AnswerData(
      answer: json['answer'],
      correct: json['correct'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'correct': correct,
    };
  }
}