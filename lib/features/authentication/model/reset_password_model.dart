class ResetPasswordRequestModel {
  final String token;
  final String email;
  final String password;
  final String confirmPassword;
  ResetPasswordRequestModel({
    required this.token,
    required this.password,
    required this.confirmPassword,
    required this.email,
  });
  // Convert the model to a JSON map for API requests
  Map<String, dynamic> toJson() {
    return {
      'forget_password_token': token,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }
}
