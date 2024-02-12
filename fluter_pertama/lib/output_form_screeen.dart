import 'package:flutter/material.dart';

class OutputFormScreen extends StatelessWidget {
  final String nama, jk, tglLahir, agama;
  OutputFormScreen({
    Key? key,
    required this.nama,
    required this.jk,
    required this.tglLahir,
    required this.agama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
  children: [
    ListTile(
      title: Text('Nama: ${nama}'),
      subtitle: Text('Jenis Kelamin: ${jk}\nTanggal Lahir: ${tglLahir}\nAgama: ${agama}'),
      tileColor: Colors.amber,
    ),
  ],
)

    );
  }
}
