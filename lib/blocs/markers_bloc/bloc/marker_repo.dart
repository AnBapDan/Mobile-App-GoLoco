// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:cm_project/models/markers_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

class MarkersRepository {
  Future<List<MarkersModel>> getMarkers() async {
    // String markersEndpoint = '';
    // Response response = await get(Uri.parse(markersEndpoint));
    // if (response.statusCode == 200) {
    //   final List markers = jsonDecode(response.body)[''];
    //   return markers.map((e) => MarkersModel.fromJson(e)).toList();
    // } else {
    //   throw Exception(response.reasonPhrase);
    // }
    List<MarkersModel> markers = [];
    markers.add(MarkersModel(
      id: '1',
      name: 'Teste',
      pos: LatLng(40.634962, -8.648256),
      status: false,
      url: Uri.parse('http://google.com'),
    ));
    return markers.toList();
  }
}
