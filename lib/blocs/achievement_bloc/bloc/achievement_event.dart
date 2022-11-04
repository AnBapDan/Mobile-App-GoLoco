part of 'achievement_bloc.dart';

@immutable
abstract class AchievementEvent extends Equatable {}

class LoadAchievementEvent extends AchievementEvent {
  @override
  List<Object?> get props => [];
}

class BuildAchievementEvent extends AchievementEvent {
  @override
  List<Object?> get props => [];
}

class PedestrianEvent extends AchievementEvent {
  @override
  List<Object?> get props => [];
}

class DistanceEvent extends AchievementEvent {
  @override
  List<Object?> get props => [];
}
