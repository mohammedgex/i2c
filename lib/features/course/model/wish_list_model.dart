class WishListResponseModel {
  final String status;
  final List<WishListModel> data;
  final Pagination pagination;

  WishListResponseModel({
    required this.status,
    required this.data,
    required this.pagination,
  });

  factory WishListResponseModel.fromJson(Map<String, dynamic> json) {
    return WishListResponseModel(
      status: json['status'],
      data: (json['data'] as List)
          .map((course) => WishListModel.fromJson(course))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class 
WishListModel {
  final String slug;
  final String title;
  final String thumbnail;
  final String price;
  var discount;
  final Instructor instructor;
  final int students;
  final int averageRating;

  WishListModel({
    required this.slug,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.discount,
    required this.instructor,
    required this.students,
    required this.averageRating,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      slug: json['slug'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'],
      discount: json['discount'],
      instructor: Instructor.fromJson(json['instructor']),
      students: json['students'],
      averageRating: json['average_rating'],
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
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

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

  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      first: json['first'],
      prev: json['prev'],
      next: json['next'],
      last: json['last'],
    );
  }
}
