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
    double value = 180;
    final SizedBox space = SizedBox(
      width: 10,
    );
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Stack(
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    color: Colors.red,
                    height: 180,
                    width: 180,
                  ),
                ),
                SizedBox(
                  child: Container(
                    color: Color.fromARGB(121, 158, 158, 158),
                    height: 10,
                    width: 158,
                    child: Text(
                      message,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ],
            ),
            space,
          ],
        ),
      ),
    );
  }
}
