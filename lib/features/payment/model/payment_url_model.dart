class PaymentErrorResponseModel {
  final String status;
  final String message;
  final String supportCurrency;

  PaymentErrorResponseModel({
    required this.status,
    required this.message,
    required this.supportCurrency,
  });

  factory PaymentErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentErrorResponseModel(
      status: json['status'],
      message: json['message'],
      supportCurrency: json['supportCurrency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'supportCurrency': supportCurrency,
    };
  }
}


class PaymentUrlResponseModel {
  final String status;
  final String url;

  PaymentUrlResponseModel({
    required this.status,
    required this.url,
  });

  factory PaymentUrlResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentUrlResponseModel(
      status: json['status'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'url': url,
    };
  }
}
