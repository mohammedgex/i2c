class AddToCartResponseModel {
  final String status;
  final String message;
  final int cartCount;

  AddToCartResponseModel({
    required this.status,
    required this.message,
    required this.cartCount,
  });

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) {
    return AddToCartResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      cartCount: int.tryParse(json['cart_count'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'cart_count': cartCount,
    };
  }
}
