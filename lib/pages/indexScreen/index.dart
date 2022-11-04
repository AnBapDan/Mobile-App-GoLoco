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
  IndexPage(this.context, {super.key});
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    Size size = MediaQuery.of(context).size;
    ProfileModel profile = ProfileModel.init();
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * 0.055),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: GoAppBar(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoadedState) {
                      return WelcomePanel(size: size, profile: state.profile);
                    } else {
                      return WelcomePanel(size: size, profile: profile);
                    }
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                DataPanel(size: size),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SearchPlacesButton()),
    );
  }
}
