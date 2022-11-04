part of 'achievement_bloc.dart';

@immutable
abstract class AchievementState extends Equatable {}

class AchievementLoadingState extends AchievementState {
  @override
  List<Object?> get props => [];
}

class AchievementLoadedState extends AchievementState {
  AchievementLoadedState(this.achievements);
  final List<AchievementModel> achievements;
  @override
  List<Object?> get props => [achievements];
}

class StepCountState extends AchievementState {
  final int steps;
  StepCountState(this.steps);

  @override
  List<Object?> get props => [steps];
}

// class DistanceTraveledState extends AchievementState {
//   final double distance;
//   DistanceTraveledState(this.distance);

//   @override
//   List<Object?> get props => [distance];
// }
