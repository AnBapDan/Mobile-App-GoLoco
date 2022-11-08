part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {}

class LoadMapEvent extends MapEvent {
  @override
  List<Object?> get props => [];
}

class UpdateLocationEvent extends MapEvent {
  UpdateLocationEvent({required this.position});
  final Position position;
  @override
  List<Object?> get props => [position];
}
