part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {}

class LoadProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class CreateProfileEvent extends ProfileEvent {
  final String name;
  final String email;
  final String password;

  CreateProfileEvent(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}
