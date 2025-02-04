class UpdateAddressRequestModel {
  final int countryId;
  final String state;
  final String city;
  final String address;

  UpdateAddressRequestModel({
    required this.countryId,
    required this.state,
    required this.city,
    required this.address,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'country_id': countryId,
      'state': state,
      'city': city,
      'address': address,
    };
  }

  // Create a model from a JSON map
  factory UpdateAddressRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateAddressRequestModel(
      countryId: json['country_id'],
      state: json['state'],
      city: json['city'],
      address: json['address'],
    );
  }
}