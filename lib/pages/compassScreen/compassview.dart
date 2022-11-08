// // ignore_for_file: prefer_const_constructors

// import 'package:cm_project/blocs/map_bloc/bloc/map_bloc.dart';
// import 'package:cm_project/blocs/map_bloc/bloc/map_repo.dart';
// import 'package:flutter/cupertino.dart' show CupertinoIcons;
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:math';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// part 'widgets/custom_painter.dart';

// class CompassView extends StatelessWidget {
//   final LatLng goal;

//   CompassView({
//     required this.goal,
//     Key? key,
//   }) : super(key: key);

//   double angle = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MapBloc, MapState>(
//       builder: (context, state) {
//         if (state is MapLoadedState) {
//           angle = RepositoryProvider.of<MapRepository>(context)
//               .getAngle(state.position, goal);

//           return AspectRatio(
//             aspectRatio: 1.0,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 // Rose Painter

//                 CustomPaint(
//                   painter: _CompassViewPainter(
//                     heading: state.position.heading,
//                     foregroundColor: Color.fromARGB(255, 202, 225, 229),
//                   ),
//                 ),
              // Text(
              //   'aaaa',
              //   style: Theme.of(context).textTheme.headline3,
              // ),
//                 // Bearing Indicator
//                 Padding(
//                   padding: const EdgeInsets.all(35.0),
//                   child: Transform.rotate(
//                     angle: (angle - state.position.heading).toRadians(),
//                     child: Align(
//                       alignment: Alignment.topCenter,
//                       child: Icon(
//                         CupertinoIcons.location_north_line_fill,
//                         color: Colors.red,
//                         size: 40,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
          // compassAsset: Padding(
          //   padding: const EdgeInsets.all(35.0),
          //   child: SizedBox(
          //     height: MediaQuery.of(context).size.height * 0.4,
          //     width: MediaQuery.of(context).size.height * 0.4,
          //     child: Transform.rotate(
          //       angle: radians(angle - state.position.heading),
          //       child: Align(
          //         alignment: Alignment.topCenter,
          //         child: Icon(
          //           CupertinoIcons.location_north_line_fill,
          //           color: Colors.red,
          //           size: 40,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),