import 'package:fluter_pertama/detailflora.dart';
import 'package:flutter/material.dart';
import './helpers/size_helper.dart';

class ListFloraScreen extends StatelessWidget {
  final List<Map<String, dynamic>> floraData = [
    {
      "nama": "Bungeong Jeumpa",
      "asal": " Nanggroe Aceh Darussalam (NAD)",
      "image": "assets/img/jema.jpg",
      "des": "ini adalah...."
    },
    {
      "nama": "Kenanga",
      "asal": "Sumatera Utara",
      "image": "assets/img/kenanga.jpg",
      "des": "ini adalah...."
    },
    {
      "nama": "Anggrek Hitam",
      "asal": " Kalimantan Timur",
      "image": "assets/img/agh.jpg",
      "des": "ini adalah...."
    },
    {
      "nama": "Rafflesia",
      "asal": "Bengkulu",
      "image": "assets/img/raflesia.jpg",
      "des": "ini adalah...."
    },
    {
      "nama": "Kantil",
      "asal": "Jawa Tengah",
      "image": "assets/img/kantil.jpeg",
      "des": "ini adalah...."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/bckg.jpg'), fit: BoxFit.cover),
        ),
        child: ListView.builder(
            itemCount: floraData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailFloraScreen(
                        nama: floraData[index]["nama"],
                        asal: floraData[index]["asal"],
                        image: floraData[index]["image"],
                        des: floraData[index]["des"],
                      ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: displayHeight(context) * 0.25,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("${floraData[index]["image"]}"),
                      fit: BoxFit.cover, 
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "${floraData[index]["nama"]} - ${floraData[index]["asal"]}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
