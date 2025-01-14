class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  // Convert the model to a JSON map for API requests
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}


class LoginResponseModel {
  final String status;
  final String message;
  final String bearerToken;
  final int userId;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.bearerToken,
    required this.userId,
  });

  // Factory method to create an instance from JSON
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      bearerToken: json['bearer_token'] ?? '',
      userId: json['user_id'] ?? 0,
    );
  }
}
