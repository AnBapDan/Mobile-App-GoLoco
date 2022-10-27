import 'package:cm_project/models/profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// Achievement Related Stuff
@immutable
abstract class AchievementState extends Equatable {}

class AchievementLoadingState extends AchievementState {
  @override
  List<Object?> get props => [];
}

class AchievementLoadedState extends AchievementState {
  @override
  List<Object?> get props => [];
}

// Profile Related Stuff

@immutable
abstract class ProfileState extends Equatable {}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  ProfileLoadedState(this.profile);
  final ProfileModel profile;

  @override
  List<Object?> get props => [profile];
}

class ProfileCreateState extends ProfileState {
  ProfileCreateState(this.deviceId);
  final String? deviceId;

  @override
  List<Object?> get props => [];
}

class ProfileErrorState extends ProfileState {
  ProfileErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
