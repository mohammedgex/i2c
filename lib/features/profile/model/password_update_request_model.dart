class PasswordUpdateRequestModel {
  final String currentPassword;
  final String newPassword;
  final String passwordConfirmation;

  PasswordUpdateRequestModel({
    required this.currentPassword,
    required this.newPassword,
    required this.passwordConfirmation,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'current_password': currentPassword,
      'password': newPassword,
      'password_confirmation': passwordConfirmation,
    };
  }

  // Create a model from a JSON map
  factory PasswordUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    return PasswordUpdateRequestModel(
      currentPassword: json['current_password'],
      newPassword: json['password'],
      passwordConfirmation: json['password_confirmation'],
    );
  }
}