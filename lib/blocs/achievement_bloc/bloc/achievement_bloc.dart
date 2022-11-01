import 'package:cm_project/blocs/achievement_bloc/bloc/achievement_repo.dart';
import 'package:cm_project/models/markers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'achievement_event.dart';
part 'achievement_state.dart';

class AchievementBloc extends Bloc<AchievementEvent, AchievementState> {
  final AchievementRepository _achievementRepository;

  AchievementBloc(this._achievementRepository)
      : super(AchievementLoadingState()) {
    on<LoadAchievementEvent>((event, emit) async {
      emit(AchievementLoadingState());
    });
  }
}
