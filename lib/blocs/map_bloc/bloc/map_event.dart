part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {}

class LoadMapEvent extends MapEvent {
  @override
  List<Object?> get props => [];
}

class UpdateMapEvent extends MapEvent {
  final Position position;
  UpdateMapEvent(this.position);

  @override
  List<Object?> get props => [position];
}

class ResizeMapEvent extends MapEvent {
  @override
  List<Object?> get props => [];
}
