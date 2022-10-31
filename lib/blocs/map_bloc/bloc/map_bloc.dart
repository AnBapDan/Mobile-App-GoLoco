// ignore_for_file: void_checks

import 'dart:async';
import 'package:cm_project/blocs/map_bloc/bloc/map_repo.dart';
import 'package:cm_project/pages/mapScreen/utils/location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _mapRepository;
  StreamSubscription? _geolocationSubscription;

  MapBloc(MapRepository mapRepository)
      : _mapRepository = mapRepository,
        super(MapLoadingState()) {
    on<LoadMapEvent>(
      (event, emit) async* {
        emit(MapLoadingState());
        print('out');
        final perms = await Location.locationActivated();
        print(perms);
        if (perms) {
          print('has perms');
          yield* _mapGeolocationToState();
        }
      },
    );
    on<UpdateMapEvent>(
      (event, emit) async* {
        emit(MapLoadedState(event.position));
        //yield* _mapUpdateGeolocationToState(event);
      },
    );
  }

  Stream<MapState> _mapGeolocationToState() async* {
    _geolocationSubscription?.cancel();
    final Position position = await _mapRepository.getCurrentLocation();
    add(UpdateMapEvent(position));
  }

  Stream<MapState> _mapUpdateGeolocationToState(UpdateMapEvent event) async* {
    yield MapLoadedState(event.position);
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
