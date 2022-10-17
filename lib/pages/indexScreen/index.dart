// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cm_project/misc/custom_appbar.dart';
import 'package:cm_project/misc/latest_places.dart';
import 'package:cm_project/misc/themes.dart';
import 'package:cm_project/pages/giroscopeScreen/tracker.dart';
import 'package:cm_project/pages/indexScreen/panel_places.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: GoAppBar(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.14,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.start,
                      'Bem Vindo(a), Daniel',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                height: size.height,
                width: size.width,
                decoration: containers(Color.fromARGB(33, 255, 255, 255)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Os Meus Dados',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Places(size: size),
                      Divider(
                        color: Colors.white70,
                        thickness: 2,
                        indent: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Conquistas',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TrackerPage()),
            );
          },
          label: Text(
            'Procurar Locais',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}
