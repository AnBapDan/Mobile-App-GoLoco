// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

InputDecoration formatTextField(BuildContext context, String label) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    hintText: '',
    labelText: label,
    labelStyle: Theme.of(context).textTheme.headline3,
  );
}
