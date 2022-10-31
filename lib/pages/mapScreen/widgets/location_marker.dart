// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget BuildMarkerWidget(Offset pos, Color color, BuildContext context,
    [IconData icon = Icons.location_on]) {
  return Positioned(
    left: pos.dx - 24,
    top: pos.dy - 24,
    width: 48,
    height: 48,
    child: GestureDetector(
      child: Icon(
        icon,
        color: color,
        size: 48,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            content: Text('You have clicked a marker!'),
          ),
        );
      },
    ),
  );
}
