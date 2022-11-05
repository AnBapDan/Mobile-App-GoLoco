// ignore_for_file: prefer_const_constructors

import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/pages/registerScreen/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  final String name;
  final String email;
  final String password;

  const RegisterButton({
    Key? key,
    required this.password,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Color.fromARGB(25, 202, 240, 248),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: () {
        print("password = $password");
        print("nome = $name");
        print("email = $email");
        if (!nameValidator(name, context)) {
          return;
        } else if (!emailValidator(email, context)) {
          return;
        } else if (!passwordValidator(password, context)) {
          return;
        }

        return BlocProvider.of<ProfileBloc>(context).add(
          CreateProfileEvent(
            name,
            email,
            password,
          ),
        );
      },
      label: Text(
        'Registar',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
