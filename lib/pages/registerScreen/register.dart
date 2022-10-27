import 'package:cm_project/blocs/app_blocs.dart';
import 'package:cm_project/blocs/app_states.dart';
import 'package:cm_project/misc/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  final String? deviceId;

  const RegisterPage({
    super.key,
    required this.deviceId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: containers(Colors.red),
              height: MediaQuery.of(context).size.height / 3,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      hintText: '',
                      labelText: 'Insere um nome de utilizador'),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Regista o teu email'),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Insere uma password'),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Insere uma password'),
                ),
                BlocProvider.of<ProfileBloc>(context)
                    .emit(ProfileLoadedState(profile))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
