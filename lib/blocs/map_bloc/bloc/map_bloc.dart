// ignore_for_file: void_checks

import 'package:cm_project/blocs/map_bloc/bloc/map_repo.dart';
import 'package:cm_project/pages/mapScreen/utils/location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _mapRepository;

  MapBloc(this._mapRepository) : super(MapLoadingState()) {
    on<LoadMapEvent>(
      (event, emit) async {
        emit(MapLoadingState());
        final locationGranted = await GeoLocation.hasPermissions();
        final LocationData position;
        if (locationGranted) {
          position = await _mapRepository.getCurrentLocation();
          add(UpdateLocationEvent(position: position));
        } else {
          return;
        }
      },
    );

    on<UpdateLocationEvent>(
      (event, emit) async {
        await emit.forEach(
          Location().onLocationChanged,
          onData: (data) {
            return MapLoadedState(data);
          },
        );
      },
    );
  }
}
