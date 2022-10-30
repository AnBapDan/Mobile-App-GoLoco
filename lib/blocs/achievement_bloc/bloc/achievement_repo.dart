// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart';
import 'package:cm_project/models/achievement_model.dart';

final String url = '';

class AchievementRepository {
  Future<List<AchievementModel>> getAchievements() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List achievements = jsonDecode(response.body)[''];
      return achievements.map((e) => AchievementModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
