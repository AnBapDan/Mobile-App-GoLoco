// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class GoAppBar extends StatefulWidget {
  const GoAppBar({super.key});

  @override
  State<GoAppBar> createState() => _GoAppBarState();
}

class _GoAppBarState extends State<GoAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        leading: Image.asset(
          'assets/logo.png',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 202, 225, 229),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 202, 225, 229),
            ),
          )
        ],
      ),
    );
  }
}
