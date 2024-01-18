import 'package:fluter_pertama/main.dart';
import 'package:flutter/material.dart';

class ContainerNama extends StatelessWidget {
  const ContainerNama({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.deepPurpleAccent,
            Colors.pinkAccent
          ]),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 0.5)),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.50)),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.tealAccent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 0.50)),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 0.50)),
            alignment: Alignment.center,
            child: Text(
              'Saputra Nurahman',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[400],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
