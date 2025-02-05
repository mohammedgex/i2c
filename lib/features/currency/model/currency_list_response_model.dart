class CurrencyListResponse {
  final String status;
  final List<CurrencyData> data;

  CurrencyListResponse({
    required this.status,
    required this.data,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((currency) => currency.toJson()).toList(),
    };
  }

  // Create a model from a JSON map
  factory CurrencyListResponse.fromJson(Map<String, dynamic> json) {
    return CurrencyListResponse(
      status: json['status'],
      data: (json['data'] as List)
          .map((currency) => CurrencyData.fromJson(currency))
          .toList(),
    );
  }
}

class CurrencyData {
  final bool currencyIcon;
  final String currencyName;
  final String currencyCode;
  final String countryCode;
  final double currencyRate;
  final String currencyPosition;
  final String isDefault;
  final String status;

  CurrencyData({
    required this.currencyIcon,
    required this.currencyName,
    required this.currencyCode,
    required this.countryCode,
    required this.currencyRate,
    required this.currencyPosition,
    required this.isDefault,
    required this.status,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'currency_icon': currencyIcon,
      'currency_name': currencyName,
      'currency_code': currencyCode,
      'country_code': countryCode,
      'currency_rate': currencyRate,
      'currency_position': currencyPosition,
      'is_default': isDefault,
      'status': status,
    };
  }

  // Create a model from a JSON map
  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    return CurrencyData(
      currencyIcon: json['currency_icon'],
      currencyName: json['currency_name'],
      currencyCode: json['currency_code'],
      countryCode: json['country_code'],
      currencyRate: json['currency_rate'].toDouble(),
      currencyPosition: json['currency_position'],
      isDefault: json['is_default'],
      status: json['status'],
    );
  }
}