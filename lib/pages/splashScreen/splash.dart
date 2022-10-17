// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cm_project/pages/indexScreen/index.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedSplashScreen.withScreenFunction(
      backgroundColor: Colors.black,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
        ],
      ),
      screenFunction: () async {
        //Implement methods to check for the API requests and widget build
        WidgetsFlutterBinding.ensureInitialized();
        return IndexPage();
      },
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
