import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       Container(
          height: 100,
          width: 100,
          color: Colors.black26,
          child: FlutterLogo(),
          margin: EdgeInsets.all(10),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.redAccent,
          child: FlutterLogo(),
          margin: EdgeInsets.all(10),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: FlutterLogo(),
          margin: EdgeInsets.all(10),
        ),
        Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.amber,
              child: FlutterLogo(),
              margin: EdgeInsets.all(10),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.amber,
              child: FlutterLogo(),
              margin: EdgeInsets.all(10),
            )
          ],
        )
      ],
    );
  }
}