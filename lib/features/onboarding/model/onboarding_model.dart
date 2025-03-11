class OnboardingModel {
  final String status;
  final List<WelcomeData> data;

  OnboardingModel({required this.status, required this.data});

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      status: json['status'],
      data: List<WelcomeData>.from(
          json['data'].map((item) => WelcomeData.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class WelcomeData {
  final String title;
  final String description;

  WelcomeData({required this.title, required this.description});

  factory WelcomeData.fromJson(Map<String, dynamic> json) {
    return WelcomeData(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      
    };
  }
}
