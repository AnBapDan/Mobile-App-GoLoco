// ignore_for_file: prefer_const_constructors

import 'package:cm_project/pages/mapScreen/maps.dart';
import 'package:flutter/material.dart';

class SearchPlacesButton extends StatelessWidget {
  const SearchPlacesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapsPage()),
        );
      },
      label: Text(
        'Procurar Locais',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      icon: Icon(Icons.search),
    );
  }
}
