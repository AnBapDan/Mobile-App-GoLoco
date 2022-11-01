// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cm_project/models/markers_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker BuildMarkerWidget(
  MarkersModel marker,
  BuildContext context,
) {
  return Marker(
    markerId: MarkerId(marker.id),
    position: marker.pos,
    icon: marker.status
        ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
        : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    onTap: () {
      //TODO
    },
  );
}
