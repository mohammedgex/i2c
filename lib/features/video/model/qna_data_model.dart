class QnaDataResponseModel {
  final String status;
  final List<QnaQuestion> data;
  final Pagination pagination;

  QnaDataResponseModel({
    required this.status,
    required this.data,
    required this.pagination,
  });

  factory QnaDataResponseModel.fromJson(Map<String, dynamic> json) {
    return QnaDataResponseModel(
      status: json['status'],
      data: List<QnaQuestion>.from(json['data'].map((x) => QnaQuestion.fromJson(x))),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class QnaQuestion {
  final int id;
  final String question;
  final String description;
  final int repliesCount;
  final bool seen;
  final String createdAt;
  final User user;
  final List<QnaReply> replies;

  QnaQuestion({
    required this.id,
    required this.question,
    required this.description,
    required this.repliesCount,
    required this.seen,
    required this.createdAt,
    required this.user,
    required this.replies,
  });

  factory QnaQuestion.fromJson(Map<String, dynamic> json) {
    return QnaQuestion(
      id: json['id'],
      question: json['question'],
      description: json['description'],
      repliesCount: json['replies_count'],
      seen: json['seen'],
      createdAt: json['created_at'],
      user: User.fromJson(json['user']),
      replies: List<QnaReply>.from(json['replies'].map((x) => QnaReply.fromJson(x))),
    );
  }
}

class QnaReply {
  final int id;
  final int questionId;
  final String reply;
  final String createdAt;
  final User user;

  QnaReply({
    required this.id,
    required this.questionId,
    required this.reply,
    required this.createdAt,
    required this.user,
  });

  factory QnaReply.fromJson(Map<String, dynamic> json) {
    return QnaReply(
      id: json['id'],
      questionId: json['question_id'],
      reply: json['reply'],
      createdAt: json['created_at'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String name;
  final String image;

  User({
    required this.id,
    required this.name,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class Pagination {
  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;
  final Links links;

  Pagination({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.lastPage,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'],
      perPage: json['per_page'],
      total: json['total'],
      lastPage: json['last_page'],
      links: Links.fromJson(json['links']),
    );
  }
}

class Links {
  final String first;
  final String? prev;
  final String? next;
  final String last;

  Links({
    required this.first,
    this.prev,
    this.next,
    required this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      prev: json['prev'],
      next: json['next'],
      last: json['last'],
    );
  }
}
