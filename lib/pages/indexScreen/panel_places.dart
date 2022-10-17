// ignore_for_file: prefer_const_constructors

import 'package:cm_project/misc/latest_places.dart';
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
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Ultimos Locais',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(
          height: size.height / 5,
          width: size.width,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              space,
              PlacesWidget(
                color: Color.fromARGB(255, 168, 70, 92),
                asset: 'assets/logo.png',
                message: 'Ganhe 30€ por convite',
              ),
              PlacesWidget(
                color: Color.fromARGB(255, 168, 70, 92),
                asset: 'assets/logo.png',
                message: 'Ganhe 30€ por convite',
              ),
              PlacesWidget(
                color: Color.fromARGB(255, 168, 70, 92),
                asset: 'assets/logo.png',
                message: 'Ganhe 30€ por convite',
              ),
              PlacesWidget(
                color: Color.fromARGB(255, 168, 70, 92),
                asset: 'assets/logo.png',
                message: 'Ganhe 30€ por convite',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
