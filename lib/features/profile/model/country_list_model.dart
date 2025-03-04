class CountryListResponseModel {
  final String status;
  final List<CountryListModel> data;

  CountryListResponseModel({required this.status, required this.data});

  // Factory method to create an instance from JSON
  factory CountryListResponseModel.fromJson(Map<String, dynamic> json) {
    return CountryListResponseModel(
      status: json['status'],
      data: (json['data'] as List)
          .map((item) => CountryListModel.fromJson(item))
          .toList(),
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((country) => country.toJson()).toList(),
    };
  }
}

class CountryListModel {
  final int id;
  final String name;

  CountryListModel({required this.id, required this.name});

  // Factory method to create an instance from JSON
  factory CountryListModel.fromJson(Map<String, dynamic> json) {
    return CountryListModel(
      id: json['id'],
      name: json['name'],
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}