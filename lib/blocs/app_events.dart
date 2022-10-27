import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AchievementEvent extends Equatable {}

class LoadAchievementEvent extends AchievementEvent {
  @override
  List<Object?> get props => [];
}

@immutable
abstract class ProfileEvent extends Equatable {}

class LoadProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
