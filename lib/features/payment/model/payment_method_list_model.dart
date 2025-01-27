// class PaymentMethodResponseModel {
//   final String status;
//   final PaymentMethods data;

//   PaymentMethodResponseModel({required this.status, required this.data});

//   factory PaymentMethodResponseModel.fromJson(Map<String, dynamic> json) {
//     return PaymentMethodResponseModel(
//       status: json['status'],
//       data: PaymentMethods.fromJson(json['data']),
//     );
//   }
// }

// class PaymentMethods {
//   final PaymentMethod stripe;
//   final PaymentMethod paypal;
//   final PaymentMethod bank;
//   final PaymentMethod razorpay;
//   final PaymentMethod flutterwave;
//   final PaymentMethod paystack;
//   final PaymentMethod mollie;
//   final PaymentMethod instamojo;

//   PaymentMethods({
//     required this.stripe,
//     required this.paypal,
//     required this.bank,
//     required this.razorpay,
//     required this.flutterwave,
//     required this.paystack,
//     required this.mollie,
//     required this.instamojo,
//   });

//   factory PaymentMethods.fromJson(Map<String, dynamic> json) {
//     return PaymentMethods(
//       stripe: PaymentMethod.fromJson(json['stripe']),
//       paypal: PaymentMethod.fromJson(json['paypal']),
//       bank: PaymentMethod.fromJson(json['bank']),
//       razorpay: PaymentMethod.fromJson(json['razorpay']),
//       flutterwave: PaymentMethod.fromJson(json['flutterwave']),
//       paystack: PaymentMethod.fromJson(json['paystack']),
//       mollie: PaymentMethod.fromJson(json['mollie']),
//       instamojo: PaymentMethod.fromJson(json['instamojo']),
//     );
//   }
// }

// class PaymentMethod {
//   final String name;
//   final String logo;
//   final bool status;

//   PaymentMethod({required this.name, required this.logo, required this.status});

//   factory PaymentMethod.fromJson(Map<String, dynamic> json) {
//     return PaymentMethod(
//       name: json['name'],
//       logo: json['logo'],
//       status: json['status'],
//     );
//   }
// }


class PaymentMethodResponseModel {
  final String status;
  final Map<String, PaymentMethod> paymentMethods;

  PaymentMethodResponseModel({required this.status, required this.paymentMethods});

  factory PaymentMethodResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodResponseModel(
      status: json['status'],
      paymentMethods: (json['data'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, PaymentMethod.fromJson(value)),
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final String logo;
  final bool status;

  PaymentMethod({required this.name, required this.logo, required this.status});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      name: json['name'],
      logo: json['logo'],
      status: json['status'],
    );
  }
}
