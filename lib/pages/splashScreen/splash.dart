// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages
import 'package:cm_project/blocs/achievement_bloc/bloc/achievement_bloc.dart';
import 'package:cm_project/blocs/markers_bloc/bloc/marker_bloc.dart';
import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/pages/indexScreen/index.dart';
import 'package:cm_project/pages/registerScreen/register.dart';
import 'package:cm_project/pages/splashScreen/utils/auth_failed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: BlocProvider.of<ProfileBloc>(context),
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ],
          );
        } else if (state is ProfileCreateState) {
          return RegisterPage();
        } else if (state is ProfileLoadedState) {
          BlocProvider.of<MarkersBloc>(context).add(LoadMarkersEvent());
          BlocProvider.of<AchievementBloc>(context).add(LoadAchievementEvent());
          WidgetsFlutterBinding.ensureInitialized();
          return IndexPage(context);
        } else if (state is ProfileNotAuthState) {
          return AuthFailed();
        } else if (state is ProfileErrorState) {
          print(state.error);
          return Center(
            child: Text(
              'Oops, algo deu errado.',
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        }
        return Center(
          child: Text(
            '???.',
            style: Theme.of(context).textTheme.headline1,
          ),
        );
      },
    );
  }
}
