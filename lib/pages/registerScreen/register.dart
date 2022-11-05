// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors
import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/pages/registerScreen/utils/background.dart';
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
    return Scaffold(
      body: Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Text(
                "REGISTER",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 22, 104, 218),
                  fontSize: 36
                ),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                onChanged: (value) {
                        name = value;
                      },
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Nome'),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                 onChanged: (value) {
                        name = value;
                      },
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Email'),
              ),
            ),

           SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                onChanged: (value) {
                        password = value;
                      },
                      cursorColor: Color.fromARGB(255, 255, 255, 255),
                      cursorWidth: 1,
                      decoration: formatTextField(context, 'Password'),
                obscureText: true,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.05),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextButton(
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
               
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(70.0),
                    gradient: new LinearGradient(
                      colors: [
                        Color.fromARGB(255, 48, 128, 239),
                        Color.fromARGB(255, 0, 23, 104)
                      ]
                    )
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Registar",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ),
             
            ],
        ),
      ),
    );
  }

  // Padding space(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.fromLTRB(
  //         0, 0, 0, MediaQuery.of(context).size.height * 0.03),
  //   );
  // }
}

