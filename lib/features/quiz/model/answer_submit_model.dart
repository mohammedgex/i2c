import 'dart:convert';

class AnswerSubmitResponseModel {
  final String status;
  final AnswerData data;

  AnswerSubmitResponseModel({
    required this.status,
    required this.data,
  });

  factory AnswerSubmitResponseModel.fromJson(Map<String, dynamic> json) {
    return AnswerSubmitResponseModel(
      status: json['status'],
      data: AnswerData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class AnswerData {
  final int userId;
  final int quizId;
  final Map<int, AnswerResult> result;
  final int userGrade;
  final String status;
  final String updatedAt;
  final String createdAt;
  final int id;

  AnswerData({
    required this.userId,
    required this.quizId,
    required this.result,
    required this.userGrade,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory AnswerData.fromJson(Map<String, dynamic> json) {
    return AnswerData(
      userId: json['user_id'],
      quizId: json['quiz_id'],
      result: (jsonDecode(json['result']) as Map<String, dynamic>).map(
        (key, value) => MapEntry(int.parse(key), AnswerResult.fromJson(value)),
      ),
      userGrade: json['user_grade'],
      status: json['status'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'quiz_id': quizId,
      'result': jsonEncode(
          result.map((key, value) => MapEntry(key.toString(), value.toJson()))),
      'user_grade': userGrade,
      'status': status,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}

class AnswerResult {
  final int answer;
  final bool correct;

  AnswerResult({
    required this.answer,
    required this.correct,
  });

  factory AnswerResult.fromJson(Map<String, dynamic> json) {
    return AnswerResult(
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

class AnswerSbumitRequestModel {
  final List<AnswerRequest> answers;

  AnswerSbumitRequestModel({required this.answers});

  factory AnswerSbumitRequestModel.fromJson(Map<String, dynamic> json) {
    return AnswerSbumitRequestModel(
      answers: (json['answers'] as List)
          .map((answer) => AnswerRequest.fromJson(answer))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answers': answers.map((answer) => answer.toJson()).toList(),
    };
  }
}

class AnswerRequest {
  final int questionId;
  final int answerId;

  AnswerRequest({
    required this.questionId,
    required this.answerId,
  });

  factory AnswerRequest.fromJson(Map<String, dynamic> json) {
    return AnswerRequest(
      questionId: json['question_id'],
      answerId: json['answer_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_id': questionId,
      'answer_id': answerId,
    };
  }
}
