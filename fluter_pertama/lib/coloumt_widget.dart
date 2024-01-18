import 'package:flutter/material.dart';

class ColoumtWidget extends StatelessWidget {
  const ColoumtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.amber,
              child: FlutterLogo(
                size: 60,
              ),
            ),
            Container(
              color: Colors.red,
              child: FlutterLogo(
                size: 60,
              ),
            ),
            Container(
              color: Colors.blue,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ],
        )
      ],
    );
  }
}
