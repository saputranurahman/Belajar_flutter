import 'package:flutter/material.dart';

class OutputFloraScreen extends StatelessWidget {
  final String nama, jumlah, tgl, flora;
  final double selectedFloraPrice, totalHarga;
  final String floraImage;

  OutputFloraScreen({
    Key? key,
    required this.nama,
    required this.jumlah,
    required this.tgl,
    required this.flora,
    required this.selectedFloraPrice,
    required this.totalHarga,
    required this.floraImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Output Flora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(floraImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('Nama: $nama'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jumlah Tiket Di Pesan: $jumlah'),
                      Text('Tanggal Pesan: $tgl'),
                      Text('Taman: $flora'),
                      Text('Harga per Tiket: $selectedFloraPrice'),
                      Text('Total Harga: $totalHarga'),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
