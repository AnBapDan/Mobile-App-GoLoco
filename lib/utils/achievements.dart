// ignore_for_file: prefer_const_constructors

import 'package:cm_project/blocs/achievement_bloc/bloc/achievement_bloc.dart';
import 'package:cm_project/models/achievement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget createAchievements() {
  List<AchievementModel> achievements = [];
  return BlocBuilder<AchievementBloc, AchievementState>(
      builder: (context, state) {
    if (state is AchievementLoadingState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(25, 202, 240, 248),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
        ]),
      );
    } else if (state is AchievementLoadedState) {
      achievements = state.achievements;
      BlocProvider.of<AchievementBloc>(context).add(PedestrianEvent());
    } else if (state is StepCountState) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: achievements.length <= 5 ? achievements.length : 5,
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
                  leading: CircleAvatar(
                      backgroundImage: Image.asset(
                        achievements[index].image,
                      ).image,
                      backgroundColor: Colors.transparent,
                      radius: 20),
                  title: Text(
                    achievements[index].name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                      'Desbloqueia em ${achievements[index].value - state.steps} passos',
                      style: Theme.of(context).textTheme.caption),
                  trailing: Text(
                    achievements[index].date,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  dense: true,
                  horizontalTitleGap: 10,
                  onTap: () {},
                ),
              ),
              if (index != achievements.length - 1)
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

    return Center(
      child: CircularProgressIndicator(),
    );
  });
}
