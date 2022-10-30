// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cm_project/utils/themes.dart';
import 'package:flutter/material.dart';

import 'utils/registerButton.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _checkController = TextEditingController();

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                'Registo',
                style: Theme.of(context).textTheme.headline1,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        labelText: 'Nome',
                        labelStyle: Theme.of(context).textTheme.headline2,
                      ),
                      validator: (value) {
                        bool valid = RegExp("\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+")
                            .hasMatch(value.toString());
                        if (!valid) {
                          return 'O nome nao deve conter caracteres especiais nem numeros';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: Theme.of(context).textTheme.headline2,
                      ),
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value.toString());
                        if (!emailValid) {
                          return 'Email invalido. Verifique novamente';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: Theme.of(context).textTheme.headline2),
                    ),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: 'Confirmar password',
                          labelStyle: Theme.of(context).textTheme.headline2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: RegisterButton(
          name: _nameController.value.toString(),
          email: _emailController.value.toString(),
          form: _formKey,
          password: _passwordController.value.toString(),
          check: _checkController.value.toString(),
        ),
      ),
    );
  }
}
