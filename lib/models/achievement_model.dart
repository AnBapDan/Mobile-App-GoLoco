class AchievementModel {
  final String date;
  final String name;
  final int value;
  final String image;
  final int status;

  AchievementModel({
    required this.value,
    required this.date,
    required this.image,
    required this.name,
    required this.status,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
        value: json['value'],
        date: json['date'] != '' ? json['date'] : 'Bloqueado',
        image: json['image'] ?? 'assets/logo_short.png',
        name: json['name'],
        status: json['date'] == '' ? 0 : 1);
  }
}
