class TermsAndConditionResponseModel {
  final String status;
  final TermsAndCondition data;

  TermsAndConditionResponseModel({required this.status, required this.data});

  factory TermsAndConditionResponseModel.fromJson(Map<String, dynamic> json) {
    return TermsAndConditionResponseModel(
      status: json['status'],
      data: TermsAndCondition.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class TermsAndCondition {
  final String slug;
  final String name;
  final String content;

  TermsAndCondition({required this.slug, required this.name, required this.content});

  factory TermsAndCondition.fromJson(Map<String, dynamic> json) {
    return TermsAndCondition(
      slug: json['slug'],
      name: json['name'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'content': content,
    };
  }
}
