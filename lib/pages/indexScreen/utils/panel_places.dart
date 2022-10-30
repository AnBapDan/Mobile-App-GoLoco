// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cm_project/utils/places_widget.dart';
import 'package:flutter/material.dart';

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
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return PlacesWidget(
                    color:
                        Random().nextBool() ? Colors.transparent : Colors.grey,
                    asset: 'assets/deti.png',
                    message: 'This is a test',
                  );
                },
              )),
        ),
      ],
    );
  }
}
