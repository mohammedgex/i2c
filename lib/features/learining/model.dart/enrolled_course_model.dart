

// Model for the Instructor
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
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

// Model for the Course
class Course {
  final String slug;
  final String title;
  final String thumbnail;
  final Instructor instructor;
  final int students;
  final int progress;

  Course({
    required this.slug,
    required this.title,
    required this.thumbnail,
    required this.instructor,
    required this.students,
    required this.progress,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      slug: json['slug'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      instructor: Instructor.fromJson(json['instructor']),
      students: json['students'],
      progress: json['progress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'title': title,
      'thumbnail': thumbnail,
      'instructor': instructor.toJson(),
      'students': students,
      'progress': progress,
    };
  }
}

// Model for Pagination Links
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

  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      first: json['first'],
      prev: json['prev'],
      next: json['next'],
      last: json['last'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'prev': prev,
      'next': next,
      'last': last,
    };
  }
}

// Model for Pagination
class Pagination {
  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;
  final PaginationLinks links;

  Pagination({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.lastPage,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'],
      perPage: json['per_page'],
      total: json['total'],
      lastPage: json['last_page'],
      links: PaginationLinks.fromJson(json['links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'per_page': perPage,
      'total': total,
      'last_page': lastPage,
      'links': links.toJson(),
    };
  }
}

// Model for the Full API Response
class EnrolledCourseResponseModel {
  final String status;
  final List<Course> data;
  final Pagination pagination;

  EnrolledCourseResponseModel({
    required this.status,
    required this.data,
    required this.pagination,
  });

  factory EnrolledCourseResponseModel.fromJson(Map<String, dynamic> json) {
    return EnrolledCourseResponseModel(
      status: json['status'],
      data: List<Course>.from(json['data'].map((course) => Course.fromJson(course))),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((course) => course.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}
