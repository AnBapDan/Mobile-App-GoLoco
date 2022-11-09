// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'dart:math';

import 'package:cm_project/blocs/map_bloc/bloc/map_bloc.dart';
import 'package:cm_project/blocs/map_bloc/bloc/map_repo.dart';
import 'package:cm_project/pages/qrScreen/qr_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';
import 'package:vector_math/vector_math.dart' hide Colors;

part 'widgets/custom_painter.dart';

class CompassPage extends StatelessWidget {
  final LatLng goal;

  const CompassPage({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QRScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.qr_code,
                  size: 50,
                  color: Color.fromARGB(255, 202, 225, 229),
                ),
              ),
            ),
            Center(child: BlocBuilder<MapBloc, MapState>(
              builder: (context, state) {
                if (state is MapLoadedState) {
                  var distance = RepositoryProvider.of<MapRepository>(context)
                      .calculateDistance(state.position, goal);

                  return Text(
                    '${distance.round()} m',
                    style: Theme.of(context).textTheme.headline2,
                  );
                } else {
                  return Text('');
                }
              },
            )),
            Center(
              child: SmoothCompass(
                rotationSpeed: 200,
                height: 300,
                width: 300,
                compassAsset: AspectRatio(
                  aspectRatio: 1.0,
                  child: CustomPaint(
                    painter: _CompassViewPainter(
                      heading: 0,
                    ),
                  ),
                ),
                compassBuilder: (context,
                    AsyncSnapshot<CompassModel>? compassData,
                    Widget compassAsset) {
                  return AspectRatio(
                    aspectRatio: 1.0,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        compassAsset,
                        BlocBuilder<MapBloc, MapState>(
                          builder: (context, state) {
                            if (state is MapLoadedState) {
                              var angle =
                                  RepositoryProvider.of<MapRepository>(context)
                                      .getAngle(state.position, goal);
                              return Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: Transform.rotate(
                                  angle:
                                      radians(angle - compassData!.data!.angle),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      CupertinoIcons.location_north_line_fill,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
