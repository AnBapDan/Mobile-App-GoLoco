import 'package:flutter/material.dart';

class SectionName extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const SectionName({
    required this.style,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
