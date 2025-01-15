class RegistrationRequestModel {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;

  RegistrationRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

  // Convert the model to a JSON map for API requests
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }
}

