class PrivacyPolicyResponseModel {
  final String status;
  final PrivacyPolicyData data;

  PrivacyPolicyResponseModel({required this.status, required this.data});

  factory PrivacyPolicyResponseModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyResponseModel(
      status: json['status'],
      data: PrivacyPolicyData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class PrivacyPolicyData {
  final String slug;
  final String name;
  final String content;

  PrivacyPolicyData({required this.slug, required this.name, required this.content});

  factory PrivacyPolicyData.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyData(
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
