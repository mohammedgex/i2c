class SearchResultModel {
  final String slug;
  final String title;
  final String thumbnail;
  final String price;
  final String discount;
  final Instructor instructor;
  final int students;
  final double averageRating;

  SearchResultModel({
    required this.slug,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.discount,
    required this.instructor,
    required this.students,
    required this.averageRating,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      slug: json['slug'] ?? '',
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      price: json['price'] ?? '',
      discount: json['discount'] ?? '',
      instructor: Instructor.fromJson(json['instructor'] ?? {}),
      students: json['students'] ?? 0,
      averageRating: (json['average_rating'] ?? 0).toDouble(),
    );
  }
}

class Instructor {
  final int id;
  final String name;
  final String image;

  Instructor({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
