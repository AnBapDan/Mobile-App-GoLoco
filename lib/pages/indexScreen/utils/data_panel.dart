// ignore_for_file: prefer_const_constructors

import 'package:cm_project/pages/indexScreen/utils/panel_places.dart';
import 'package:cm_project/pages/indexScreen/utils/sections_name.dart';
import 'package:cm_project/utils/achievements.dart';
import 'package:cm_project/utils/themes.dart';
import 'package:flutter/material.dart';

class DataPanel extends StatelessWidget {
  const DataPanel({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      decoration: containers(Color.fromARGB(71, 0, 180, 216)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionName(
              title: 'Os Meus Dados',
              style: Theme.of(context).textTheme.headline2,
            ),
            SectionName(
              style: Theme.of(context).textTheme.headline3,
              title: 'Ultimos Locais',
            ),
            Places(size: size),
            Divider(
              color: Color.fromARGB(255, 202, 225, 229),
              thickness: 2,
              indent: 3,
            ),
            SectionName(
              style: Theme.of(context).textTheme.headline3,
              title: 'Conquistas',
            ),
            createAchievements(),
          ],
        ),
      ),
    );
  }
}
