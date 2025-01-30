class CourseLanguageResponseModel {
  final String status;
  final List<CourseLanguageModel> data;

  CourseLanguageResponseModel({required this.status, required this.data});

  factory CourseLanguageResponseModel.fromJson(Map<String, dynamic> json) {
    return CourseLanguageResponseModel(
      status: json['status'],
      data: List<CourseLanguageModel>.from(json['data'].map((item) => CourseLanguageModel.fromJson(item))),
    );
  }
}

class CourseLanguageModel {
  final int id;
  final String name;

  CourseLanguageModel({required this.id, required this.name});

  factory CourseLanguageModel.fromJson(Map<String, dynamic> json) {
    return CourseLanguageModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
