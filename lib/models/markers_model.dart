import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersModel {
  final LatLng pos;
  final bool status;
  final Uri url;
  final String image;
  final String id;
  final String name;

  MarkersModel({
    required this.id,
    required this.name,
    required this.pos,
    required this.status,
    required this.image,
    required this.url,
  });

  factory MarkersModel.fromJson(Map<String, dynamic> json) {
    return MarkersModel(
      name: json['name'],
      id: json['id'],
      pos: LatLng(json['lat'], json['lon']),
      status: json['status'].toString().toLowerCase() == 'true',
      image: json['image'],
      url: Uri.parse(json['url']),
    );
  }
}
