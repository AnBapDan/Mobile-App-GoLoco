class AchievementModel {
  final String date;
  final String name;
  final String subtitle;
  final String image;
  final int status;

  AchievementModel({
    required this.subtitle,
    required this.date,
    required this.image,
    required this.name,
    required this.status,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
        subtitle: json['subtitle'],
        date: json['date'] ?? 'Bloqueado',
        image: json['image'] ?? 'assets/logo_short.png',
        name: json['name'],
        status: json['date'] == '' ? 0 : 1);
  }
}