class UpdateSocialLinksRequestModel {
  final String facebook;
  final String twitter;
  final String linkedin;
  final String website;
  final String github;

  UpdateSocialLinksRequestModel({
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.website,
    required this.github,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
      'website': website,
      'github': github,
    };
  }

  // Create a model from a JSON map
  factory UpdateSocialLinksRequestModel.fromJson(Map<String, dynamic> json) {
    return UpdateSocialLinksRequestModel(
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      website: json['website'],
      github: json['github'],
    );
  }
}
