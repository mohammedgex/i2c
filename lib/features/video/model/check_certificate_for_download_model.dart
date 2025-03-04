class CheckCertificateForDownloadResponseModel {
  final String status;
  final num data; // `num` can be either `int` or `double`

  CheckCertificateForDownloadResponseModel({required this.status, required this.data});

  factory CheckCertificateForDownloadResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckCertificateForDownloadResponseModel(
      status: json['status'] ?? '',
      data: json['data'] ?? 0, // Ensure it handles both `int` and `double`
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data,
    };
  }
}
