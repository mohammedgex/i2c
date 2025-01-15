class GlobalResponseModel {
  final String status;
  final String message;

  GlobalResponseModel({
    required this.status,
    required this.message,

  });

  // Factory method to create an instance from JSON
  factory GlobalResponseModel.fromJson(Map<String, dynamic> json) {
    return GlobalResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
