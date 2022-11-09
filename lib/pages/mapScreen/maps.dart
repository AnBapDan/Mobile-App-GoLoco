// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:cm_project/blocs/markers_bloc/bloc/marker_bloc.dart';
import 'package:cm_project/pages/mapScreen/utils/mapstyle.dart';
import 'package:cm_project/pages/mapScreen/widgets/marker_widget.dart';
import 'package:cm_project/pages/mapScreen/widgets/position_button.dart';
import 'package:cm_project/blocs/map_bloc/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  MapsPageState createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late final markersWidget;
  @override
  Widget build(BuildContext context) {
    MarkersState mState = BlocProvider.of<MarkersBloc>(context).state;
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        if (state is MapLoadingState || mState is MarkersLoadingState) {
          if (mState is MarkersLoadedState) {
            markersWidget = mState.markers
                .map((marker) => BuildMarkerWidget(marker, context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MapLoadedState && mState is MarkersLoadedState) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  GoogleMap(
                    //Remove os icones de +-
                    zoomControlsEnabled: false,
                    //Remove bussola do topo
                    compassEnabled: false,
                    buildingsEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    markers: {...markersWidget},
                    minMaxZoomPreference: MinMaxZoomPreference(15, 20),
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        state.position.latitude,
                        state.position.longitude,
                      ),
                      zoom: 17,
                    ),
                    onMapCreated: (GoogleMapController controller) async {
                      changeMapMode(controller);
                      _controller.complete(controller);
                    },
                  ),
                  BackButton(),
                ],
              ),
              floatingActionButton: PositionButton(controller: _controller),
            ),
          );
        } else {
          return Center(
            child: Text(
              'Oops, aconteceu algo de errado...',
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        }
      },
    );
  }
}
