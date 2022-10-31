import 'package:cm_project/blocs/markers_bloc/bloc/marker_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'marker_event.dart';
part 'marker_state.dart';

class MarkerBloc extends Bloc<MarkerEvent, MarkerState> {
  MarkerBloc(MarkersRepository of) : super(MarkerInitial());
}
