class CourseReviewsResponse {
  final String status;
  final List<Review> data;
  final Pagination pagination;

  CourseReviewsResponse({
    required this.status,
    required this.data,
    required this.pagination,
  });

  factory CourseReviewsResponse.fromJson(Map<String, dynamic> json) {
    return CourseReviewsResponse(
      status: json['status'] ?? '',
      data: (json['data'] as List)
          .map((review) => Review.fromJson(review))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Review {
  final int rating;
  final String review;
  final String name;
  final String avatar;

  Review({
    required this.rating,
    required this.review,
    required this.name,
    required this.avatar,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'] ?? 0,
      review: json['review'] ?? '',
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}

class Pagination {
  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;
  final Links links;

  Pagination({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.lastPage,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'] ?? 1,
      perPage: json['per_page'] ?? 5,
      total: json['total'] ?? 0,
      lastPage: json['last_page'] ?? 1,
      links: Links.fromJson(json['links']),
    );
  }
}

class Links {
  final String first;
  final String? prev;
  final String? next;
  final String last;

  Links({
    required this.first,
    this.prev,
    this.next,
    required this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'] ?? '',
      prev: json['prev'],
      next: json['next'],
      last: json['last'] ?? '',
    );
  }
}
