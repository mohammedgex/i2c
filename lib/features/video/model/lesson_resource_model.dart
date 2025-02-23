class LessonResourceModel {
  final int id;
  final String title;
  final String description;
  final String filePath;
  final String storage;
  final String fileType;
  final String duration;
  final bool isDownloadable;

  LessonResourceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.filePath,
    required this.storage,
    required this.fileType,
    required this.duration,
    required this.isDownloadable,
  });

  factory LessonResourceModel.fromJson(Map<String, dynamic> json) {
    return LessonResourceModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      filePath: json['file_path'],
      storage: json['storage'],
      fileType: json['file_type'],
      duration: json['duration'],
      isDownloadable: json['is_downloadable'],
    );
  }
}

class LessonResourceResponseModel {
  final String status;
  final LessonResourceModel data;

  LessonResourceResponseModel({
    required this.status,
    required this.data,
  });

  factory LessonResourceResponseModel.fromJson(Map<String, dynamic> json) {
    return LessonResourceResponseModel(
      status: json['status'],
      data: LessonResourceModel.fromJson(json['data']),
    );
  }
}