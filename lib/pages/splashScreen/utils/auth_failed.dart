import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFailed extends StatelessWidget {
  const AuthFailed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Autenticação falhada...',
                style: Theme.of(context).textTheme.headline2,
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ProfileBloc>(context).add(LoadProfileEvent());
                },
                child: Text(
                  'Tentar Novamente',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
