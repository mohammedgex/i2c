class ForgetPasswordRequestModel {
  final String email;
  ForgetPasswordRequestModel({
    required this.email,
  });
  // Convert the model to a JSON map for API requests
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

