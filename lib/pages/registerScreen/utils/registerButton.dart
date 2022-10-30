import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_device_id/platform_device_id.dart';

class RegisterButton extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  final String check;
  final GlobalKey<FormState> form;

  const RegisterButton({
    Key? key,
    required this.form,
    required this.password,
    required this.check,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        if (password != check) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text('Verifica as passwords'),
            ),
          );
        }
        if (!form.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text('Verifica novamente os campos acima'),
            ),
          );
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
