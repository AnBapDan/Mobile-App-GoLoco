import 'dart:math';

import 'package:cm_project/blocs/achievement_bloc/bloc/achievement_repo.dart';
import 'package:cm_project/models/achievement_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

part 'achievement_event.dart';
part 'achievement_state.dart';

class AchievementBloc extends Bloc<AchievementEvent, AchievementState> {
  final AchievementRepository _achievementRepository;
  final Stream<StepCount> _stepCountStream = Pedometer.stepCountStream;

  AchievementBloc(this._achievementRepository)
      : super(AchievementLoadingState()) {
    on<LoadAchievementEvent>(
      (event, emit) async {
        emit(AchievementLoadingState());

        if (await Permission.activityRecognition.isDenied) {
          await Permission.activityRecognition.request();
        }
        List<AchievementModel> achievements =
            await _achievementRepository.getAchievements();
        emit(
          AchievementLoadedState(achievements),
        );
      },
    );

    on<PedestrianEvent>(
      (event, emit) async {
        bool off = true;
        int offset = 0;
        await emit.forEach(
          _stepCountStream,
          onData: (data) {
            if (off) {
              offset = data.steps;
              off = false;
            }
            return StepCountState(data.steps - offset);
          },
        );
      },
    );

    // on<DistanceEvent>(
    //   (event, emit) async {
    //     LocationData? previous;
    //     double distance = 0;
    //     //Point Distance
    //     double calculateDistance(lat1, lon1, lat2, lon2) {
    //       var p = 0.017453292519943295;
    //       var c = cos;
    //       var a = 0.5 -
    //           c((lat2 - lat1) * p) / 2 +
    //           c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    //       return 12742 * asin(sqrt(a));
    //     }

    //     await emit.forEach(
    //       Location().onLocationChanged,
    //       onData: (data) {
    //         if (previous != null) {
    //           distance += calculateDistance(
    //             previous!.latitude,
    //             previous!.longitude,
    //             data.latitude,
    //             data.longitude,
    //           );
    //           return DistanceTraveledState(distance);
    //         } else {
    //           previous = data;
    //           return DistanceTraveledState(distance);
    //         }
    //       },
    //     );
    //   },
    // );
  }
}
