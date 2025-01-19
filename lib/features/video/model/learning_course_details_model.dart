class LearningCourseDetailsModel {
  final String status;
  final CourseData data;

  LearningCourseDetailsModel({
    required this.status,
    required this.data,
  });

  factory LearningCourseDetailsModel.fromJson(Map<String, dynamic> json) {
    return LearningCourseDetailsModel(
      status: json['status'] ?? '',
      data: CourseData.fromJson(json['data']),
    );
  }
}

class CourseData {
  final String thumbnail;
  final String title;
  final Instructor instructor;
  final List<Curriculum> curriculums;
  final Progress currentProgress;
  final List<int> alreadyWatchedLectures;
  final List<int> alreadyCompletedQuiz;

  CourseData({
    required this.thumbnail,
    required this.title,
    required this.instructor,
    required this.curriculums,
    required this.currentProgress,
    required this.alreadyWatchedLectures,
    required this.alreadyCompletedQuiz,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      thumbnail: json['thumbnail'] ?? '',
      title: json['title'] ?? '',
      instructor: Instructor.fromJson(json['instructor']),
      curriculums: (json['curriculums'] as List)
          .map((c) => Curriculum.fromJson(c))
          .toList(),
      currentProgress: Progress.fromJson(json['current_progress']),
      alreadyWatchedLectures: List<int>.from(json['already_watched_lectures'] ?? []),
      alreadyCompletedQuiz: List<int>.from(json['already_completed_quiz'] ?? []),
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
      chapters: (json['chapters'] as List)
          .map((ch) => Chapter.fromJson(ch))
          .toList(),
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
    return Chapter(
      type: json['type'] ?? '',
      lesson: json['type'] == 'lesson' ? Lesson.fromJson(json['item']) : null,
      quiz: json['type'] == 'quiz' ? Quiz.fromJson(json['item']) : null,
    );
  }
}

class Lesson {
  final int id;
  final String title;
  final String fileType;
  final String duration;
  final bool isFree;

  Lesson({
    required this.id,
    required this.title,
    required this.fileType,
    required this.duration,
    required this.isFree,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      fileType: json['file_type'] ?? '',
      duration: json['duration'] ?? '',
      isFree: json['is_free'] ?? false,
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

class Progress {
  final String type;
  final int chapterId;
  final int lessonId;
  final int watched;
  final int current;

  Progress({
    required this.type,
    required this.chapterId,
    required this.lessonId,
    required this.watched,
    required this.current,
  });

  factory Progress.fromJson(Map<String, dynamic> json) {
    return Progress(
      type: json['type'] ?? '',
      chapterId: json['chapter_id'] ?? 0,
      lessonId: json['lesson_id'] ?? 0,
      watched: json['watched'] ?? 0,
      current: json['current'] ?? 0,
    );
  }
}
