// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors
import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/pages/registerScreen/utils/format_field.dart';
import 'package:cm_project/pages/registerScreen/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'utils/registerButton.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String name = '';
    String email = '';
    String password = '';
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(
                color: Color.fromARGB(255, 202, 225, 229),
                height: 70,
                thickness: 3,
              ),
              Text(
                'Registo',
                style: Theme.of(context).textTheme.headline1,
              ),
              space(context),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        name = value;
                      },
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Nome'),
                    ),
                    space(context),
                    TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Email'),
                    ),
                    space(context),
                    TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Password'),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromARGB(255, 202, 225, 229),
                height: 70,
                thickness: 3,
              ),
              FloatingActionButton.extended(
                backgroundColor: Color.fromARGB(25, 202, 240, 248),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding space(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, MediaQuery.of(context).size.height * 0.03),
    );
  }
}
