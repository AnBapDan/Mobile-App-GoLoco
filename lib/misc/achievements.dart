// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ListView createAchievements(itemCount) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: itemCount,
    itemBuilder: ((context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          ListTile(
            leading: Container(
              foregroundDecoration: BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              ),
              child: CircleAvatar(
                  backgroundImage: Image.asset(
                    'assets/logo_short.png',
                  ).image,
                  backgroundColor: Colors.transparent,
                  radius: 20),
            ),
            title: Text(
              '???????',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            subtitle: Text('Desbloqueia esta conquista fazendo x KM',
                style: Theme.of(context).textTheme.caption),
            trailing: Text(
              'Bloqueado',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            dense: true,
            horizontalTitleGap: 10,
            onTap: () {},
          ),
          if (index != itemCount - 1)
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Divider(
                color: Colors.white70,
                thickness: 0.5,
                indent: 3,
              ),
            ),
        ]),
      );
    }),
  );
}
