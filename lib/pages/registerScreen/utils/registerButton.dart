// ignore_for_file: prefer_const_constructors

import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_device_id/platform_device_id.dart';

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
      onPressed: () async {
        print(name);
        if (false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text('Erros detetados'),
            ),
          );
          return;
        }
        String? deviceId = await PlatformDeviceId.getDeviceId;
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
