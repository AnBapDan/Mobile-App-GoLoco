// ignore_for_file: void_checks

import 'dart:async';

import 'package:cm_project/blocs/map_bloc/bloc/map_repo.dart';
import 'package:cm_project/pages/mapScreen/utils/location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _mapRepository;
  Stream<Position>? positionStream;
  final LocationSettings locationSettings = LocationSettings();

  Position? position;
  MapBloc(this._mapRepository) : super(MapLoadingState()) {
    on<LoadMapEvent>(
      (event, emit) async {
        emit(MapLoadingState());
        final locationGranted = await GeoLocation.hasPermissions();

        if (locationGranted) {
          position = await _mapRepository.getCurrentLocation();
          positionStream =
              Geolocator.getPositionStream(locationSettings: locationSettings);
          add(UpdateLocationEvent(position: position!));
        } else {
          return;
        }
      },
    );

    on<UpdateLocationEvent>(
      (event, emit) async {
        await emit.forEach(
          positionStream!,
          onData: (data) {
            return MapLoadedState(data);
          },
        );
      },
    );
  }
}
