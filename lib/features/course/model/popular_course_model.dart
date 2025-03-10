class PopularCourseResponseModel {
  final String status;
  final List<CourseData> data;

  PopularCourseResponseModel({
    required this.status,
    required this.data,
  });

  // Factory method to parse JSON
  factory PopularCourseResponseModel.fromJson(Map<String, dynamic> json) {
    return PopularCourseResponseModel(
      status: json['status'],
      data: (json['data'] as List)
          .map((course) => CourseData.fromJson(course))
          .toList(),
    );
  }

  // Convert CourseModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((course) => course.toJson()).toList(),
    };
  }
}

class CourseData {
  final String slug;
  final String title;
  final String thumbnail;
  final String price;
  final  discount;
  final Instructor instructor;
  final int students;
  final double averageRating;

  CourseData({
    required this.slug,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.discount,
    required this.instructor,
    required this.students,
    required this.averageRating,
  });

  // Factory method to parse JSON
  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      slug: json['slug'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'],
      discount: json['discount'],
      instructor: Instructor.fromJson(json['instructor']),
      students: json['students'],
      averageRating: (json['average_rating'] as num).toDouble(),
    );
  }

  // Convert CourseData to JSON
  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'title': title,
      'thumbnail': thumbnail,
      'price': price,
      'discount': discount,
      'instructor': instructor.toJson(),
      'students': students,
      'average_rating': averageRating,
    };
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

  // Factory method to parse JSON
  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  // Convert Instructor to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
