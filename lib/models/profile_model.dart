class ProfileModel {
  final String name;
  final String avatar;
  final String token;

  ProfileModel({
    required this.name,
    required this.avatar,
    required this.token,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      avatar: json['avatar'],
      token: json['token'],
    );
  }
}
