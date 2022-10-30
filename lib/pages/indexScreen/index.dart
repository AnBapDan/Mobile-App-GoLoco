// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/pages/indexScreen/utils/data_panel.dart';
import 'package:cm_project/pages/indexScreen/utils/search_places_button.dart';
import 'package:cm_project/pages/indexScreen/utils/welcome_panel.dart';
import 'package:cm_project/utils/custom_appbar.dart';
import 'package:cm_project/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProfileState state = BlocProvider.of<ProfileBloc>(context).state;
    ProfileModel profile = ProfileModel.init();
    if (state is ProfileLoadedState) {
      profile = state.profile;
    }
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.055),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: GoAppBar(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WelcomePanel(size: size, profile: profile),
              SizedBox(
                height: size.height * 0.01,
              ),
              DataPanel(size: size),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SearchPlacesButton(),
      ),
    );
  }
}
