class LanguageResponseModel {
  final String status;
  final List<Language> data;

  LanguageResponseModel({required this.status, required this.data});

  factory LanguageResponseModel.fromJson(Map<String, dynamic> json) {
    var languageList = (json['data'] as List)
        .map((languageJson) => Language.fromJson(languageJson))
        .toList();

    return LanguageResponseModel(
      status: json['status'],
      data: languageList,
    );
  }
}

class Language {
  final String code;
  final String name;
  final String direction;
  final bool isDefault;
  final bool status;

  Language({
    required this.code,
    required this.name,
    required this.direction,
    required this.isDefault,
    required this.status,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'],
      name: json['name'],
      direction: json['direction'],
      isDefault: json['is_default'],
      status: json['status'],
    );
  }
}
