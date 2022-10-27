import 'package:flutter/animation.dart';

class MarkersModel {
  final double lat;
  final double lon;
  final int status;
  final Uri url;
  final Color color;

  MarkersModel({
    required this.lat,
    required this.lon,
    required this.status,
    required this.url,
    required this.color,
  });

  factory MarkersModel.fromJson(Map<String, dynamic> json) {
    return MarkersModel(
      lat: json['lat'],
      lon: json['lon'],
      status: json['status'],
      url: Uri.parse(json['url']),
      color: Color(json['color']),
    );
  }
}
