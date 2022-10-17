// ignore_for_file: prefer_const_constructors

import 'package:cm_project/misc/themes.dart';

import 'package:cm_project/pages/splashScreen/splash.dart';
import 'package:flutter/material.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoLoco',
      theme: themes(),
      home: SplashScreen(),
    );
  }
}
