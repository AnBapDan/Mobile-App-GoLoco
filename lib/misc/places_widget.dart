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
    const SizedBox space = SizedBox(
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
                SizedBox(
                  height: value,
                  width: value,
                  child: Image.asset(
                    asset,
                    fit: BoxFit.fill,
                    color: color == Colors.transparent ? null : color,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    child: Container(
                      color: Color.fromARGB(121, 158, 158, 158),
                      height: 30,
                      width: value,
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
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
