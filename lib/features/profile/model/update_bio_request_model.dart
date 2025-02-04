class UpdateBioRequestModel {
  final String jobTitle;
  final String shortBio;
  final String bio;

  UpdateBioRequestModel({
    required this.jobTitle,
    required this.shortBio,
    required this.bio,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'job_title': jobTitle,
      'short_bio': shortBio,
      'bio': bio,
    };
  }

  // Create a model from a JSON map
  factory UpdateBioRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateBioRequestModel(
      jobTitle: json['job_title'],
      shortBio: json['short_bio'],
      bio: json['bio'],
    );
  }
}