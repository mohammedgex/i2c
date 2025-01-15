class CategoryListResponseModel {
  final String slug;
  final String name;
  final String icon;
  final bool showAtTrending;

  CategoryListResponseModel({
    required this.slug,
    required this.name,
    required this.icon,
    required this.showAtTrending,
  });

  // Factory method to create a Category object from JSON
  factory CategoryListResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryListResponseModel(
      slug: json['slug'],
      name: json['name'],
      icon: json['icon'],
      showAtTrending: json['show_at_trending'],
    );
  }

  // Convert a Category object to JSON
  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'icon': icon,
      'show_at_trending': showAtTrending,
    };
  }
}

class CategoryModel {
  final String status;
  final List<CategoryListResponseModel> categories;

  CategoryModel({
    required this.status,
    required this.categories,
  });

  // Factory method to create a CategoryModel object from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      status: json['status'],
      categories: (json['data'] as List)
          .map((categoryJson) =>
              CategoryListResponseModel.fromJson(categoryJson))
          .toList(),
    );
  }

  // Convert a CategoryModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': categories.map((category) => category.toJson()).toList(),
    };
  }
}
