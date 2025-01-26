class CartResponseModel {
  final String status;
  final CartData data;

  CartResponseModel({required this.status, required this.data});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      status: json['status'],
      data: CartData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class CartData {
  final int totalQty;
  final String totalAmount;
  final List<CartCourse> cartCourses;

  CartData({
    required this.totalQty,
    required this.totalAmount,
    required this.cartCourses,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      totalQty: json['total_qty'],
      totalAmount: json['total_amount'],
      cartCourses: List<CartCourse>.from(
        json['cart_courses'].map((course) => CartCourse.fromJson(course)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_qty': totalQty,
      'total_amount': totalAmount,
      'cart_courses': cartCourses.map((course) => course.toJson()).toList(),
    };
  }
}

class CartCourse {
  final String slug;
  final String title;
  final String thumbnail;
  final String price;
  final String discount;
  final Instructor instructor;
  final int students;
  final double averageRating;

  CartCourse({
    required this.slug,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.discount,
    required this.instructor,
    required this.students,
    required this.averageRating,
  });

  factory CartCourse.fromJson(Map<String, dynamic> json) {
    return CartCourse(
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

  Instructor({required this.id, required this.name, required this.image});

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
