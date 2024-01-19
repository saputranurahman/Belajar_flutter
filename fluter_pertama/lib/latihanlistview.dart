
import 'package:flutter/material.dart';

class LatihanView extends StatelessWidget {
  LatihanView({super.key});
  final List<String> entries = <String>['Judul Satu', 'Judul Dua', 'Judul Tiga','Judul Empat','Judul Lima'];
  final List<int> colorCodes = <int>[600, 500, 100,200,400];
  final List<String> judul = <String>['Marvel', 'Spider', 'Batman','Ival','Ucok'];
    // final List<String> img = <String>['assets/img/marvel.jpg','assets/marvel/marvel.jpg','assets/img/marvel.jpg','assets/img/marvel.jpg','assets/img/marvel.jpg'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.grey,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 300,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 170,
                    margin: EdgeInsets.all(8),
                    // color: Colors.amber[colorCodes[index]],
                    child: Column(
                      children: [
                        Image.asset('assets/img/marvel.jpg',fit: BoxFit.cover,width: double.infinity,height: 130,),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text('${entries[index]}'),
                        // ),
                      ],

                    ),
                    
                  ),
                );
              }
            ),
        ),
        Container(
          // color: Colors.grey,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 110,
                    height: 160,
                    // color: Colors.amber[colorCodes[index]],
                    child: Column(
                      children: [
                        Image.network('data:image/png;base64,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',
                        fit: BoxFit.cover,width: double.infinity,height: 90,)
                      ],
                    ),
                    // child: Center(child: Text(' ${judul[index]}')),
                  ),
                );
              }),
              
        ),
        
      ],
    );
  }
}