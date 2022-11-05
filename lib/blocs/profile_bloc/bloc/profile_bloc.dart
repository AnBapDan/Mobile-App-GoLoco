import 'package:cm_project/blocs/profile_bloc/bloc/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cm_project/models/profile_model.dart';
import 'package:cm_project/pages/splashScreen/utils/fingerprint.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc(this._profileRepository) : super(ProfileLoadingState()) {
    on<LoadProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());

      //check biometrics / pin
      final isAuthenticated = await FingerPrint.authenticate();

      if (!isAuthenticated) {
        //TODO Remove comments
        //emit(ProfileNotAuthState());
        //return;
      }

      //Get key if exists
      SharedPreferences sp = await SharedPreferences.getInstance();
      String key = sp.getString('user_key') ?? '';
      if (key == '') {
        emit(ProfileCreateState());
      } else {
        try {
          final profile = await _profileRepository.getProfile(key);
          emit(ProfileLoadedState(profile));
        } catch (error) {
          emit(ProfileErrorState(error.toString()));
        }
      }
    });

    on<CreateProfileEvent>(
      ((event, emit) async {
        String? deviceId = await PlatformDeviceId.getDeviceId;
        try {
          final profileCreation = await _profileRepository.createProfile(
            event.name,
            event.email,
            event.password,
            deviceId!,
          );
          emit(
            ProfileLoadedState(profileCreation),
          );
        } catch (error) {
          emit(ProfileErrorState(error.toString()));
        }
      }),
    );
  }
}
