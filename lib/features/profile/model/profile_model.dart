class UserDataResponseModel {
  final String status;
  final UserDataModel data;

  UserDataResponseModel({required this.status, required this.data});

  // Factory method to create a UserModel from JSON
  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) {
    return UserDataResponseModel(
      status: json['status'],
      data: UserDataModel.fromJson(json['data']),
    );
  }

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class UserDataModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int age;
  final String image;
  final String jobTitle;
  final String shortBio;
  final String bio;
  final String gender;
  final int countryId;
  final String state;
  final String city;
  final String address;
  final String facebook;
  final String twitter;
  final String linkedin;
  final String website;
  final String github;

  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
    required this.image,
    required this.jobTitle,
    required this.shortBio,
    required this.bio,
    required this.gender,
    required this.countryId,
    required this.state,
    required this.city,
    required this.address,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.website,
    required this.github,
  });

  // Factory method to create a UserData from JSON
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      age: json['age'],
      image: json['image'],
      jobTitle: json['job_title'],
      shortBio: json['short_bio'],
      bio: json['bio'],
      gender: json['gender'],
      countryId: json['country_id'],
      state: json['state'],
      city: json['city'],
      address: json['address'],
      facebook: json['facebook'],
      twitter: json['twitter'],
      linkedin: json['linkedin'],
      website: json['website'],
      github: json['github'],
    );
  }

  // Convert UserData to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'age': age,
      'image': image,
      'job_title': jobTitle,
      'short_bio': shortBio,
      'bio': bio,
      'gender': gender,
      'country_id': countryId,
      'state': state,
      'city': city,
      'address': address,
      'facebook': facebook,
      'twitter': twitter,
      'linkedin': linkedin,
      'website': website,
      'github': github,
    };
  }
}
