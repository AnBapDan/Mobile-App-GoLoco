// ignore_for_file: prefer_const_constructors

import 'package:cm_project/misc/scroll.dart';
import 'package:cm_project/misc/themes.dart';

import 'package:cm_project/pages/splashScreen/splash.dart';
import 'package:cm_project/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      title: 'GoLoco',
      theme: themes(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AchievementRepository()),
          RepositoryProvider(create: (context) => MarkersRepository()),
          RepositoryProvider(create: (context) => ProfileRepository()),
        ],
        child: SplashScreen(),
      ),
    );
  }
}
