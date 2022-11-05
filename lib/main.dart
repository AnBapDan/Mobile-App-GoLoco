// ignore_for_file: prefer_const_constructors

import 'package:cm_project/blocs/achievement_bloc/bloc/achievement_bloc.dart';
import 'package:cm_project/blocs/achievement_bloc/bloc/achievement_repo.dart';
import 'package:cm_project/blocs/map_bloc/bloc/map_bloc.dart';
import 'package:cm_project/blocs/map_bloc/bloc/map_repo.dart';
import 'package:cm_project/blocs/markers_bloc/bloc/marker_bloc.dart';
import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/blocs/profile_bloc/bloc/profile_repo.dart';
import 'package:cm_project/utils/scroll.dart';
import 'package:cm_project/utils/themes.dart';
import 'package:cm_project/pages/splashScreen/splash.dart';
import 'package:cm_project/blocs/markers_bloc/bloc/marker_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AchievementRepository()),
        RepositoryProvider(create: (context) => MarkersRepository()),
        RepositoryProvider(create: (context) => ProfileRepository()),
        RepositoryProvider(create: (context) => MapRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProfileBloc(
              RepositoryProvider.of<ProfileRepository>(context),
            )..add(
                LoadProfileEvent(),
              ),
          ),
          BlocProvider(
            create: (context) => MapBloc(
              RepositoryProvider.of<MapRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => MarkersBloc(
              RepositoryProvider.of<MarkersRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AchievementBloc(
              RepositoryProvider.of<AchievementRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            );
          },
          title: 'GoLoco',
          theme: themes(),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
