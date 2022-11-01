import 'package:cm_project/blocs/markers_bloc/bloc/marker_repo.dart';
import 'package:cm_project/models/markers_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'marker_event.dart';
part 'marker_state.dart';

class MarkersBloc extends Bloc<MarkersEvent, MarkersState> {
  final MarkersRepository _markersRepository;

  MarkersBloc(this._markersRepository) : super(MarkersLoadingState()) {
    on<LoadMarkersEvent>(
      (event, emit) async {
        emit(MarkersLoadingState());
        List<MarkersModel> markers = await _markersRepository.getMarkers();
        emit(MarkersLoadedState(markers));
      },
    );
  }
}
