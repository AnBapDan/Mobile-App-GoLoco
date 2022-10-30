class ProfileModel {
  late final String name;
  late final String avatar;
  late final String token;

  ProfileModel({
    required this.name,
    required this.avatar,
    required this.token,
  });

  ProfileModel.init() {
    name = '';
    avatar = '';
    token = '';
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      avatar: json['avatar'],
      token: json['token'],
    );
  }
}
