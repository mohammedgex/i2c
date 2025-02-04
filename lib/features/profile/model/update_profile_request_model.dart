class UpdateProfileRequestModel {
  final String name;
  final String email;
  final String phone;
  final int age;

  UpdateProfileRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'age': age,
    };
  }

  // Create a model from a JSON map
  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileRequestModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      age: json['age'],
    );
  }
}