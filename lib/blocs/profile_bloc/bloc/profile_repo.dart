// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:cm_project/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  String url = 'http://192.168.31.247:3000/';

  Future<ProfileModel> getProfile(String key) async {
    String profileEndpoint = '${url}profile/key/${key.toString()}';
    http.Response response = await http.get(Uri.parse(profileEndpoint));
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
    //return ProfileModel(name: 'Dani', avatar: 'assets/avatar.png', token: '');
  }

  Future<ProfileModel> createProfile(
    String name,
    String email,
    String password,
    String deviceId,
  ) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String profileEndpoint = '${url}profile/create_account';
    http.Response response = await http.post(
      Uri.parse(profileEndpoint),
      body: {
        "name": name,
        "email": email,
        "password": password,
        "device_id": deviceId,
      },
    );
    if (response.statusCode == 201) {
      sp.setString('user_key', jsonDecode(response.body)['key']);
      return ProfileModel.fromJson(jsonDecode(response.body)['profile']);
    } else {
      throw Exception(response.body);
    }
    //return ProfileModel( name: 'Daniel', avatar: 'assets/avatar.png', token: 'abcde');
  }
}
