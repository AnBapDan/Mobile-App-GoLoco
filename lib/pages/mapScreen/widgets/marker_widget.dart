// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cm_project/models/markers_model.dart';
import 'package:cm_project/pages/compassScreen/compass.dart';
import 'package:cm_project/pages/qrScreen/qr_code.dart';
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
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.47,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    marker.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.height * 0.4,
                    // child: Image.asset(
                    //   'assets/deti.png',
                    //   fit: BoxFit.fill,
                    // ),
                    child: Image.network(
                      marker.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CompassPage(
                            goal: marker.pos,
                          ),
                        ),
                      );
                    },
                    label: Text(
                      'Iniciar jornada',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
