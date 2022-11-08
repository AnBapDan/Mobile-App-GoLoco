import 'dart:async';

import 'package:cm_project/blocs/map_bloc/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionButton extends StatelessWidget {
  const PositionButton({
    Key? key,
    required Completer<GoogleMapController> controller,
  })  : _controller = controller,
        super(key: key);

  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    MapState mapState = BlocProvider.of<MapBloc>(context).state;
    return SizedBox(
      width: 50,
      height: 50,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () async {
            if (mapState is MapLoadedState) {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      bearing: mapState.position.heading,
                      target: LatLng(
                        mapState.position.latitude,
                        mapState.position.longitude,
                      ),
                      zoom: 18),
                ),
              );
            }
          },
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}
