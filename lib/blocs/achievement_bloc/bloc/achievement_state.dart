part of 'achievement_bloc.dart';

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
