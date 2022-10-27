// ignore_for_file: unused_local_variable
import 'package:cm_project/pages/splashScreen/utils/fingerprint.dart';
import 'package:cm_project/blocs/app_events.dart';
import 'package:cm_project/blocs/app_states.dart';
import 'package:cm_project/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_device_id/platform_device_id.dart';

class AchievementBloc extends Bloc<AchievementEvent, AchievementState> {
  final AchievementRepository _achievementRepository;

  AchievementBloc(this._achievementRepository)
      : super(AchievementLoadingState()) {
    on<LoadAchievementEvent>((event, emit) async {
      emit(AchievementLoadingState());
    });
  }
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc(this._profileRepository) : super(ProfileLoadingState()) {
    on<LoadProfileEvent>((event, emit) async {
      String? deviceId = await PlatformDeviceId.getDeviceId;
      emit(ProfileLoadingState());
      final isAuthenticated = await FingerPrint.authenticate();
      if (isAuthenticated) {
        try {
          final profile = await _profileRepository.getProfile(deviceId);
          print('aqui');
          if (profile.token == '') {
            print('null');
            emit(ProfileCreateState(deviceId));
          }
        } catch (e) {
          emit(ProfileErrorState(e.toString()));
        }
      } else {
        //TODO: Pagina de pôr um pin
        print('pin cenas');
      }
    });
  }
}
