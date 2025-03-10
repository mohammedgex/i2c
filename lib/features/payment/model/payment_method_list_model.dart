class PaymentMethodResponseModel {
  final String status;
  final Map<String, PaymentMethod> paymentMethods;

  PaymentMethodResponseModel({required this.status, required this.paymentMethods});

  factory PaymentMethodResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodResponseModel(
      status: json['status'],
      paymentMethods: (json['data'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, PaymentMethod.fromJson(key, value)),
      ),
    );
  }
}

class PaymentMethod {
  final String key; // New field to store the key
  final String name;
  final String logo;
  final bool status;

  PaymentMethod({
    required this.key, // Include the key in the constructor
    required this.name,
    required this.logo,
    required this.status,
  });

  factory PaymentMethod.fromJson(String key, Map<String, dynamic> json) {
    return PaymentMethod(
      key: key, // Pass the key to the constructor
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
    );
  }

}
