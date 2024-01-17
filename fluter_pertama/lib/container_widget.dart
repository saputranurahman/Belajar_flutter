import 'package:fluter_pertama/main.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ Colors.blue,
          Colors.deepPurpleAccent,
          Colors.pinkAccent
        ]),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black,width: 0.5)
        ),
      child: BelajarHelloWorld(),
    );
  }
}