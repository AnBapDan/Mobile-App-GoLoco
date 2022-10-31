// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cm_project/blocs/map_bloc/bloc/map_bloc.dart';
import 'package:cm_project/blocs/map_bloc/bloc/map_repo.dart';
import 'package:cm_project/blocs/markers_bloc/bloc/marker_bloc.dart';
import 'package:cm_project/blocs/markers_bloc/bloc/marker_repo.dart';
import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/pages/mapScreen/widgets/location_marker.dart';
import 'package:cm_project/pages/mapScreen/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  MapsPageState createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  final controller = MapController(
    location: const LatLng(40.6348327, -8.6480886),
  );

  final markers = [const LatLng(40.6348327, -8.6480886)];

  void _gotoDefault() {
    controller.center = const LatLng(40.6348327, -8.6480886);
    setState(() {});
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Scaffold(
          body: MapLayout(
            controller: controller,
            builder: (context, transformer) {
              final markerPositions =
                  markers.map(transformer.toOffset).toList();

              final markerWidgets = markerPositions.map(
                (pos) => BuildMarkerWidget(pos, Colors.red, context),
              );

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onDoubleTapDown: (details) => _onDoubleTap(
                  transformer,
                  details.localPosition,
                ),
                onScaleStart: _onScaleStart,
                onScaleUpdate: (details) =>
                    _onScaleUpdate(details, transformer),
                child: Listener(
                  behavior: HitTestBehavior.opaque,
                  onPointerSignal: (event) {
                    if (event is PointerScrollEvent) {
                      final delta = event.scrollDelta.dy / -1000.0;
                      final zoom = clamp(controller.zoom + delta, 2, 18);

                      transformer.setZoomInPlace(zoom, event.localPosition);
                      setState(() {});
                    }
                  },
                  child: Stack(
                    children: [
                      TileLayer(
                        builder: (context, x, y, z) {
                          final tilesInZoom = pow(2.0, z).floor();

                          while (x < 0) {
                            x += tilesInZoom;
                          }
                          while (y < 0) {
                            y += tilesInZoom;
                          }

                          x %= tilesInZoom;
                          y %= tilesInZoom;

                          return CachedNetworkImage(
                            imageUrl: google(z, x, y),
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      ...markerWidgets,
                      Positioned(
                        top: 30,
                        left: 10,
                        child: FloatingActionButton(
                          heroTag: null,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print(state);
              if (state is MapLoadedState) {
                print('aqui');
                controller.center = LatLng(
                  state.position.latitude,
                  state.position.longitude,
                );
              }
            },
            child: const Icon(Icons.my_location),
          ),
        );
      },
    );
  }
}
