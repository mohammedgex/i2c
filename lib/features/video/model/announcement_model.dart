class AnnouncementResponseModel {
  final String status;
  final List<Announcement> data;

  AnnouncementResponseModel({
    required this.status,
    required this.data,
  });

  factory AnnouncementResponseModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementResponseModel(
      status: json['status'],
      data: List<Announcement>.from(
          json['data'].map((x) => Announcement.fromJson(x))),
    );
  }
}

class Announcement {
  final String title;
  final String announcement;
  final String createdAt;
  final Instructor instructor;

  Announcement({
    required this.title,
    required this.announcement,
    required this.createdAt,
    required this.instructor,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      title: json['title'],
      announcement: json['announcement'],
      createdAt: json['created_at'],
      instructor: Instructor.fromJson(json['instructor']),
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
