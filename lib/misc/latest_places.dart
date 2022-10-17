import 'package:cm_project/misc/themes.dart';
import 'package:flutter/material.dart';

class PlacesWidget extends StatelessWidget {
  final Color color;
  final String asset;
  final String message;

  const PlacesWidget({
    Key? key,
    required this.color,
    required this.asset,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Container(
                color: Colors.red,
                height: size.height,
                width: size.height,
              ),
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: Container(
                color: Color.fromARGB(121, 158, 158, 158),
                height: size.height,
                width: size.height,
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
