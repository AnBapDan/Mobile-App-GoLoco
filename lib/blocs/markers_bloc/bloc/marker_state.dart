part of 'marker_bloc.dart';

abstract class MarkersState extends Equatable {}

class MarkersLoadingState extends MarkersState {
  @override
  List<Object> get props => [];
}

class MarkersLoadedState extends MarkersState {
  final List<MarkersModel> markers;
  MarkersLoadedState(this.markers);

  @override
  List<Object> get props => [markers];
}

class MarkersErrorState extends MarkersState {
  final String error;
  MarkersErrorState(this.error);
  @override
  List<Object> get props => [error];
}
