class QuizResponseModel {
  final String status;
  final QuizData data;

  QuizResponseModel({
    required this.status,
    required this.data,
  });

  factory QuizResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizResponseModel(
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
  final Quiz quiz;
  final int attempt;

  QuizData({
    required this.quiz,
    required this.attempt,
  });

  factory QuizData.fromJson(Map<String, dynamic> json) {
    return QuizData(
      quiz: Quiz.fromJson(json['quiz']),
      attempt: json['attempt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quiz': quiz.toJson(),
      'attempt': attempt,
    };
  }
}

class Quiz {
  final int id;
  final String title;
  final int time;
  final int attempt;
  final int passMark;
  final int totalMark;
  final int totalQuestions;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.title,
    required this.time,
    required this.attempt,
    required this.passMark,
    required this.totalMark,
    required this.totalQuestions,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      time: json['time'],
      attempt: json['attempt'],
      passMark: json['pass_mark'],
      totalMark: json['total_mark'],
      totalQuestions: json['total_questions'],
      questions: List<Question>.from(json['questions'].map((q) => Question.fromJson(q))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'attempt': attempt,
      'pass_mark': passMark,
      'total_mark': totalMark,
      'total_questions': totalQuestions,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

class Question {
  final int id;
  final String title;
  final String type;
  final List<Answer> answers;

  Question({
    required this.id,
    required this.title,
    required this.type,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      answers: List<Answer>.from(json['answers'].map((a) => Answer.fromJson(a))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }
}

class Answer {
  final int id;
  final String title;

  Answer({
    required this.id,
    required this.title,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
