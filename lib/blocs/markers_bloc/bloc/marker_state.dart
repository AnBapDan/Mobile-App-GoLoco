part of 'marker_bloc.dart';

abstract class MarkerState extends Equatable {
  const MarkerState();
  
  @override
  List<Object> get props => [];
}

class MarkerInitial extends MarkerState {}
