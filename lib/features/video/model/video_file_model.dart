class VideoFileResponseModel {
  final String status;
  final VideoData data;

  VideoFileResponseModel({required this.status, required this.data});

  factory VideoFileResponseModel.fromJson(Map<String, dynamic> json) {
    return VideoFileResponseModel(
      status: json['status'],
      data: VideoData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class VideoData {
  final int id;
  final String title;
  final String description;
  final String filePath;
  final String storage;
  final String fileType;
  final String duration;
  final bool isDownloadable;

  VideoData({
    required this.id,
    required this.title,
    required this.description,
    required this.filePath,
    required this.storage,
    required this.fileType,
    required this.duration,
    required this.isDownloadable,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'file_path': filePath,
      'storage': storage,
      'file_type': fileType,
      'duration': duration,
      'is_downloadable': isDownloadable,
    };
  }
}

// Example usage:
// final videoFile = VideoFile.fromJson(jsonDecode(responseBody));
// print(videoFile.data.title);