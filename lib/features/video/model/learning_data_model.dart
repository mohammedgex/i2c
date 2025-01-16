class EnrolledCourseResponseModel {
  final String status;
  final LearningCourseData data;

  EnrolledCourseResponseModel({required this.status, required this.data});

  factory EnrolledCourseResponseModel.fromJson(Map<String, dynamic> json) {
    return EnrolledCourseResponseModel(
      status: json['status'],
      data: LearningCourseData.fromJson(json['data']),
    );
  }
}


class LearningCourseData {
  final String thumbnail;
  final String title;
  final Instructor instructor;
  final List<Curriculum> curriculums;
  final Progress currentProgress;
  final List<int> alreadyWatchedLectures;
  final List<int> alreadyCompletedQuiz;

  LearningCourseData({
    required this.thumbnail,
    required this.title,
    required this.instructor,
    required this.curriculums,
    required this.currentProgress,
    required this.alreadyWatchedLectures,
    required this.alreadyCompletedQuiz,
  });

  factory LearningCourseData.fromJson(Map<String, dynamic> json) {
    return LearningCourseData(
      thumbnail: json['thumbnail'],
      title: json['title'],
      instructor: Instructor.fromJson(json['instructor']),
      curriculums: List<Curriculum>.from(json['curriculums'].map((x) => Curriculum.fromJson(x))),
      currentProgress: Progress.fromJson(json['current_progress']),
      alreadyWatchedLectures: List<int>.from(json['already_watched_lectures'].map((x) => x)),
      alreadyCompletedQuiz: List<int>.from(json['already_completed_quiz'].map((x) => x)),
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
      chapters: List<Chapter>.from(json['chapters'].map((x) => Chapter.fromJson(x))),
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
  final String fileType;
  final String duration;
  final bool isFree;

  ChapterItem({
    required this.id,
    required this.title,
    required this.fileType,
    required this.duration,
    required this.isFree,
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
      type: json['type'],
      chapterId: json['chapter_id'],
      lessonId: json['lesson_id'],
      watched: json['watched'],
      current: json['current'],
    );
  }
}






