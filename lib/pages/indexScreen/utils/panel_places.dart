// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cm_project/blocs/markers_bloc/bloc/marker_bloc.dart';
import 'package:cm_project/utils/places_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Places extends StatelessWidget {
  Places({
    Key? key,
    required this.size,
    SizedBox? space,
  }) : super(key: key);

  final Size size;
  final SizedBox space = SizedBox(
    width: 2,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: SizedBox(
              height: size.height / 5,
              width: size.width,
              child: BlocBuilder<MarkersBloc, MarkersState>(
                builder: (context, state) {
                  if (state is! MarkersLoadedState) {
                    return Center(
                      child: Text(
                        'A Processar...',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    );
                  }
                  var completedMarkers = state.markers
                      .where((element) => element.status == true)
                      .toList();
                  return Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: completedMarkers.length <= 5
                          ? completedMarkers.length
                          : 5,
                      itemBuilder: (context, index) {
                        return PlacesWidget(
                          asset: completedMarkers[index].image,
                          message: completedMarkers[index].name,
                        );
                      },
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}
