part of 'map_bloc.dart';

@immutable
abstract class MapState extends Equatable {}

class MapLoadingState extends MapState {
  @override
  List<Object?> get props => [];
}

class MapLoadedState extends MapState {
  final Position position;
  MapLoadedState(this.position);

  @override
  List<Object?> get props => [position];
}

class MapErrorState extends MapState {
  MapErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
