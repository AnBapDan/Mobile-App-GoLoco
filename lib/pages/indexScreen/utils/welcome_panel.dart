import 'package:cm_project/models/profile_model.dart';
import 'package:flutter/material.dart';

class WelcomePanel extends StatelessWidget {
  const WelcomePanel({
    Key? key,
    required this.size,
    required this.profile,
  }) : super(key: key);

  final Size size;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.09,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            textAlign: TextAlign.start,
            'Bem Vindo(a), ${profile.name}',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
