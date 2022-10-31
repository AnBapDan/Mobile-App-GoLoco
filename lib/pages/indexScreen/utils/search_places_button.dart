// ignore_for_file: prefer_const_constructors

import 'package:cm_project/blocs/map_bloc/bloc/map_bloc.dart';
import 'package:cm_project/pages/mapScreen/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPlacesButton extends StatelessWidget {
  const SearchPlacesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        BlocProvider.of<MapBloc>(context).add(LoadMapEvent());
        Navigator.of(context).push(
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
