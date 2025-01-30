class SubcategoryResponseModel {
  final String status;
  final List<SubCategoryListModel> data;

  SubcategoryResponseModel({
    required this.status,
    required this.data,
  });

  factory SubcategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryResponseModel(
      status: json['status'],
      data: (json['data'] as List)
          .map((item) => SubCategoryListModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class SubCategoryListModel {
  final String slug;
  final String name;

  SubCategoryListModel({
    required this.slug,
    required this.name,
  });

  factory SubCategoryListModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryListModel(
      slug: json['slug'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
    };
  }
}
