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
      decoration: containers(Color.fromARGB(33, 255, 255, 255)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
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
              color: Colors.white70,
              thickness: 2,
              indent: 3,
            ),
            SectionName(
              style: Theme.of(context).textTheme.headline3,
              title: 'Conquistas',
            ),
            createAchievements(5),
          ],
        ),
      ),
    );
  }
}
