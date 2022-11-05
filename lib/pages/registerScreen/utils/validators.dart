// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

bool nameValidator(String name, BuildContext context) {
  if (name.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Por favor, preenche o nome'),
      ),
    );
    return false;
  }
  bool valid = RegExp("^([ \u00c0-\u01ffa-zA-Z'\-])+\$").hasMatch(name);
  if (!valid) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content:
            Text('O nome nao deve conter caracteres especiais nem numeros'),
      ),
    );
    return false;
  }
  return true;
}

bool emailValidator(String email, BuildContext context) {
  if (email.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Por favor, preenche o email'),
      ),
    );
    return false;
  }
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (!emailValid) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Email invalido. Verifique novamente'),
      ),
    );
    return false;
  }
  return true;
}

bool passwordValidator(String password, BuildContext context) {
  if (password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Por favor, preenche a password'),
      ),
    );
    return false;
  }
  return true;
}
