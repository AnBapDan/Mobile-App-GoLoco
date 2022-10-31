// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages
import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/blocs/profile_bloc/bloc/profile_repo.dart';
import 'package:cm_project/pages/indexScreen/index.dart';
import 'package:cm_project/pages/registerScreen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => ProfileBloc(
        RepositoryProvider.of<ProfileRepository>(context),
      )..add(LoadProfileEvent()),
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
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
        }

        if (state is ProfileCreateState) {
          return RegisterPage();
        }
        if (state is ProfileLoadedState) {
          WidgetsFlutterBinding.ensureInitialized();
          return IndexPage();
        }
        if (state is ProfileErrorState) {
          print(state.error);
        }
        return Text(
          'Oops, algo deu errado.',
          style: Theme.of(context).textTheme.headline1,
        );
      }),
    );
  }
}
