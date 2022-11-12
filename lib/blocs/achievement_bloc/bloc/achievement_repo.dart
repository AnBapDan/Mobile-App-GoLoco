// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart';
import 'package:cm_project/models/achievement_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AchievementRepository {
  String url = 'http://192.168.178.87:3000/';
  Future<List<AchievementModel>> getAchievements() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Response response =
        await get(Uri.parse("${url}achievements/${sp.getString('user_key')}"));
    if (response.statusCode == 200) {
      final List achievements = jsonDecode(response.body);
      return achievements.map((e) => AchievementModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
