part of 'profile_bloc.dart';

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
  @override
  List<Object?> get props => [];
}

class ProfileNotAuthState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileErrorState extends ProfileState {
  ProfileErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
