// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:cm_project/models/achievement_model.dart';
import 'package:cm_project/models/markers_model.dart';
import 'package:cm_project/models/profile_model.dart';
import 'package:http/http.dart';

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

class MarkersRepository {
  Future<List<MarkersModel>> getMarkers() async {
    String markersEndpoint = '';
    Response response = await get(Uri.parse(markersEndpoint));
    if (response.statusCode == 200) {
      final List markers = jsonDecode(response.body)[''];
      return markers.map((e) => MarkersModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class ProfileRepository {
  Future<ProfileModel> getProfile(String? deviceId) async {
    // String profileEndpoint = 'http://localhost:3000/$deviceId';
    // Response response = await get(Uri.parse(profileEndpoint));
    // if (response.statusCode == 200) {
    //   return ProfileModel.fromJson(jsonDecode(response.body)['']);
    // } else {
    //   throw Exception(response.reasonPhrase);
    // }
    return ProfileModel(name: 'Dani', avatar: 'assets/avatar.png', token: '');
  }

  Future<ProfileModel> createProfile(String name) async {
    // String profileEndpoint = 'http://localhost:3000/$deviceId';
    // Response response = await get(Uri.parse(profileEndpoint));
    // if (response.statusCode == 200) {
    //   return ProfileModel.fromJson(jsonDecode(response.body)['']);
    // } else {
    //   throw Exception(response.reasonPhrase);
    // }
    return ProfileModel(
        name: 'Emulated', avatar: 'assets/avatar.png', token: 'abcde');
  }
}
