

class LearningCourseDetailsModel {
  final String status;
  final CourseData data;

  LearningCourseDetailsModel({required this.status, required this.data});

  factory LearningCourseDetailsModel.fromJson(Map<String, dynamic> json) {
    return LearningCourseDetailsModel(
      status: json['status'],
      data: CourseData.fromJson(json['data']),
    );
  }
}

class CourseData {
  final String thumbnail;
  final String title;
  final Instructor instructor;
  final List<Curriculum> curriculums;
  final CurrentProgress currentProgress;
  late final List<String> alreadyWatchedLectures;
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
      thumbnail: json['thumbnail'],
      title: json['title'],
      instructor: Instructor.fromJson(json['instructor']),
      curriculums: (json['curriculums'] as List)
          .map((e) => Curriculum.fromJson(e))
          .toList(),
      currentProgress: CurrentProgress.fromJson(json['current_progress']),
      alreadyWatchedLectures:
          List<String>.from(json['already_watched_lectures']),
      alreadyCompletedQuiz: List<int>.from(json['already_completed_quiz']),
    );
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
}

class Curriculum {
  final String title;
  final List<Chapter> chapters;

  Curriculum({required this.title, required this.chapters});

  factory Curriculum.fromJson(Map<String, dynamic> json) {
    return Curriculum(
      title: json['title'],
      chapters:
          (json['chapters'] as List).map((e) => Chapter.fromJson(e)).toList(),
    );
  }
}

class Chapter {
  final String type;
  final ChapterItem item;

  Chapter({required this.type, required this.item});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      type: json['type'],
      item: ChapterItem.fromJson(json['item']),
    );
  }
}

class ChapterItem {
  final int id;
  final String title;
  final String? fileType;
  final String? duration;
  final bool? isFree;

  ChapterItem({
    required this.id,
    required this.title,
    this.fileType,
    this.duration,
    this.isFree,
  });

  factory ChapterItem.fromJson(Map<String, dynamic> json) {
    return ChapterItem(
      id: json['id'],
      title: json['title'],
      fileType: json['file_type'],
      duration: json['duration'],
      isFree: json['is_free'],
    );
  }
}

class CurrentProgress {
  final String type;
  final int chapterId;
  final int lessonId;
  final int watched;
  final int current;

  CurrentProgress({
    required this.type,
    required this.chapterId,
    required this.lessonId,
    required this.watched,
    required this.current,
  });

  factory CurrentProgress.fromJson(Map<String, dynamic> json) {
    return CurrentProgress(
      type: json['type'],
      chapterId: json['chapter_id'],
      lessonId: json['lesson_id'],
      watched: json['watched'],
      current: json['current'],
    );
  }
}
