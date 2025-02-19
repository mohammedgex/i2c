class CourseDetailsResponseModel {
  final String demoVideo;
  final String thumbnail;
  final bool isWishlist;
  final String videoSource;
  final String title;
  final String slug;
  final Instructor instructor;
  final double averageRating;
  final int reviewsCount;
  final int students;
  final String lastUpdated;
  final String duration;
  final bool certificate;
  final int lessonsCount;
  final int quizzesCount;
  final String languages;
  final String price;
  final String discount;
  final String description;
  final List<Curriculum> curriculums;

  CourseDetailsResponseModel({
    required this.demoVideo,
    required this.thumbnail,
    required this.isWishlist,
    required this.videoSource,
    required this.title,
    required this.slug,
    required this.instructor,
    required this.averageRating,
    required this.reviewsCount,
    required this.students,
    required this.lastUpdated,
    required this.duration,
    required this.certificate,
    required this.lessonsCount,
    required this.quizzesCount,
    required this.languages,
    required this.price,
    required this.discount,
    required this.description,
    required this.curriculums,
  });

  factory CourseDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailsResponseModel(
      demoVideo: json['demo_video'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      isWishlist: json['is_wishlist'] ?? false,
      videoSource: json['demo_video_source'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      instructor: Instructor.fromJson(json['instructor']),
      averageRating: (json['average_rating'] ?? 0).toDouble(),
      reviewsCount: json['reviews_count'] ?? 0,
      students: json['students'] ?? 0,
      lastUpdated: json['last_updated'] ?? '',
      duration: json['duration'] ?? '',
      certificate: json['certificate'] ?? false,
      lessonsCount: json['lessons_count'] ?? 0,
      quizzesCount: json['quizzes_count'] ?? 0,
      languages: json['languages'] ?? '',
      price: json['price'] ?? '',
      discount: json['discount'] ?? '',
      description: json['description'] ?? '',
      curriculums: (json['curriculums'] as List<dynamic>?)
              ?.map((e) => Curriculum.fromJson(e))
              .toList() ??
          [],
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

class Curriculum {
  final String title;
  final List<Chapter> chapters;

  Curriculum({
    required this.title,
    required this.chapters,
  });

  factory Curriculum.fromJson(Map<String, dynamic> json) {
    return Curriculum(
      title: json['title'] ?? '',
      chapters: (json['chapters'] as List<dynamic>?)
              ?.map((e) => Chapter.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Chapter {
  final String type;
  final Lesson? lesson;
  final Quiz? quiz;

  Chapter({
    required this.type,
    this.lesson,
    this.quiz,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    final item = json['item'] ?? {};
    final isLesson = item['file_type'] != null;

    return Chapter(
      type: json['type'] ?? '',
      lesson: isLesson ? Lesson.fromJson(item) : null,
      quiz: isLesson ? null : Quiz.fromJson(item),
    );
  }
}

class Lesson {
  final int id;
  final String title;
  final String? fileType;
  final String? duration;
  final bool? isFree;

  Lesson({
    required this.id,
    this.title = 'Untitled', // Default value for title
    this.fileType = '', // Default value for fileType
    this.duration = '', // Default value for duration
    this.isFree = false, // Default value for isFree
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Untitled', // Default to 'Untitled' if null
      fileType: json['file_type'] ?? '', // Default to empty string if null
      duration: json['duration'] ?? '', // Default to empty string if null
      isFree: json['is_free'] ?? false, // Default to false if null
    );
  }
}

class Quiz {
  final int id;
  final String title;

  Quiz({
    required this.id,
    required this.title,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
    );
  }
}
