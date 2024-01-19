// import 'package:fluter_pertama/coloumt_widget.dart';
// import 'package:fluter_pertama/latihan2.dart';
// import 'package:fluter_pertama/listview.dart';
import 'package:fluter_pertama/latihanlistview.dart';
import 'package:flutter/material.dart';
// import 'coloumt_widget.dart';
// import 'container_nama.dart';
// import 'rowcoloumt_widget.dart';
// import 'navigatorbar.dart';
import 'listvie2.dart';
// import 'listview3.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Belajar"),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              padding: EdgeInsets.only(right: 15),
              onPressed: () {
                // Handle the search action
                // You can navigate to a search page or show a search dialog, etc.
                print('Search action pressed!');
              },
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: LatihanView(),
        ),
      ),
    );
  }
}

class BelajarHelloWorld extends StatelessWidget {
  const BelajarHelloWorld({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello gay",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.green[400],
      ),
    );
  }
}
