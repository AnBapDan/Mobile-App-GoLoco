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
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(25, 202, 240, 248),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            child: ListTile(
              leading: Container(
                // foregroundDecoration: BoxDecoration(
                //   color: Colors.grey,
                //   backgroundBlendMode: BlendMode.saturation,
                // ),
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
          ),
          if (index != itemCount - 1)
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Divider(
                color: Color.fromARGB(255, 202, 225, 229),
                thickness: 0.5,
                indent: 0,
              ),
            ),
        ]),
      );
    }),
  );
}
