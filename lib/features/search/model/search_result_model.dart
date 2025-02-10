class Instructor {
  final int id;
  final String name;
  final String image;

  Instructor({required this.id, required this.name, required this.image});

  // Convert JSON to Instructor object
  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  // Convert Instructor object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

class Course {
  final String slug;
  final String title;
  final String thumbnail;
  final String price;
  final String discount;
  final Instructor instructor;
  final int students;
  final double average_rating;

  Course({
    required this.slug,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.discount,
    required this.instructor,
    required this.students,
    required this.average_rating,
  });

  // Convert JSON to Course object
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      slug: json['slug'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'],
      discount: json['discount'],
      instructor: Instructor.fromJson(json['instructor']),
      students: json['students'],
      average_rating: json['average_rating'].toDouble(),
    );
  }

  // Convert Course object to JSON
  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'title': title,
      'thumbnail': thumbnail,
      'price': price,
      'discount': discount,
      'instructor': instructor.toJson(),
      'students': students,
      'average_rating': average_rating,
    };
  }
}

class PaginationLinks {
  final String first;
  final String? prev;
  final String? next;
  final String last;

  PaginationLinks({
    required this.first,
    this.prev,
    this.next,
    required this.last,
  });

  // Convert JSON to PaginationLinks object
  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      first: json['first'],
      prev: json['prev'],
      next: json['next'],
      last: json['last'],
    );
  }

  // Convert PaginationLinks object to JSON
  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'prev': prev,
      'next': next,
      'last': last,
    };
  }
}

class Pagination {
  final int current_page;
  final int per_page;
  final int total;
  final int last_page;
  final PaginationLinks links;

  Pagination({
    required this.current_page,
    required this.per_page,
    required this.total,
    required this.last_page,
    required this.links,
  });

  // Convert JSON to Pagination object
  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      current_page: json['current_page'],
      per_page: json['per_page'],
      total: json['total'],
      last_page: json['last_page'],
      links: PaginationLinks.fromJson(json['links']),
    );
  }

  // Convert Pagination object to JSON
  Map<String, dynamic> toJson() {
    return {
      'current_page': current_page,
      'per_page': per_page,
      'total': total,
      'last_page': last_page,
      'links': links.toJson(),
    };
  }
}

class SearchResultResponseModel {
  final String status;
  final List<Course> data;
  final Pagination pagination;

  SearchResultResponseModel({
    required this.status,
    required this.data,
    required this.pagination,
  });

  // Convert JSON to SearchResultResponse object
  factory SearchResultResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResultResponseModel(
      status: json['status'],
      data: (json['data'] as List)
          .map((courseJson) => Course.fromJson(courseJson))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }

  // Convert SearchResultResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((course) => course.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}