// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors
import 'package:cm_project/blocs/profile_bloc/bloc/profile_bloc.dart';
import 'package:cm_project/pages/registerScreen/utils/background.dart';
import 'package:cm_project/pages/registerScreen/utils/format_field.dart';
import 'package:cm_project/pages/registerScreen/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Text(
                "REGISTAR",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 22, 104, 218),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: nameController,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                cursorWidth: 1,
                decoration: formatTextField(context, 'Nome'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: emailController,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                cursorWidth: 1,
                decoration: formatTextField(context, 'Email'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: passwordController,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                cursorWidth: 1,
                decoration: formatTextField(context, 'Password'),
                //obscureText: true,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextButton(
                onPressed: () {
                  if (!nameValidator(nameController.text, context)) {
                    return;
                  } else if (!emailValidator(emailController.text, context)) {
                    return;
                  } else if (!passwordValidator(
                      passwordController.text, context)) {
                    return;
                  }

                  return BlocProvider.of<ProfileBloc>(context).add(
                    CreateProfileEvent(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70.0),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 48, 128, 239),
                        Color.fromARGB(255, 0, 23, 104)
                      ])),
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
}
