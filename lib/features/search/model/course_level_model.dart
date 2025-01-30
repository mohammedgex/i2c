class CourseLevelModel {
  final String slug;
  final String name;

  CourseLevelModel({required this.slug, required this.name});

  factory CourseLevelModel.fromJson(Map<String, dynamic> json) {
    return CourseLevelModel(
      slug: json['slug'],
      name: json['name'],
    );
  }
}

class CourseLevelResponseModel {
  final String status;
  final List<CourseLevelModel> data;

  CourseLevelResponseModel({required this.status, required this.data});

  factory CourseLevelResponseModel.fromJson(Map<String, dynamic> json) {
    return CourseLevelResponseModel(
      status: json['status'],
      data: (json['data'] as List)
          .map((e) => CourseLevelModel.fromJson(e))
          .toList(),
    );
  }
}
