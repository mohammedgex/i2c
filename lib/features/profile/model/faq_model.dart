class FaqResponseModel {
  final String status;
  final List<FaqData> data;
  final Pagination pagination;

  FaqResponseModel({
    required this.status,
    required this.data,
    required this.pagination,
  });

  factory FaqResponseModel.fromJson(Map<String, dynamic> json) {
    return FaqResponseModel(
      status: json['status'],
      data: List<FaqData>.from(json['data'].map((item) => FaqData.fromJson(item))),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((item) => item.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}

class FaqData {
  final String question;
  final String answer;

  FaqData({
    required this.question,
    required this.answer,
  });

  factory FaqData.fromJson(Map<String, dynamic> json) {
    return FaqData(
      question: json['question'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
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

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'per_page': perPage,
      'total': total,
      'last_page': lastPage,
      'links': links.toJson(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'prev': prev,
      'next': next,
      'last': last,
    };
  }
}
