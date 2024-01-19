import 'package:flutter/material.dart';

class LatihanView extends StatelessWidget {
  LatihanView({super.key});
  final List<String> entries = <String>[
    'Karakter Super Hero',
    'Sejarah Marvel',
    'Super Hero Terkuat',
    'Semua Super Hero Berkumpul'
  ];
  final List<int> colorCodes = <int>[600, 500, 100, 200];
  final List<String> judul = <String>[
    'Iron Man',
    'Spider',
    'Thor',
    'Captain America'
  ];
  final List<String> img = <String>[
    'assets/img/marvel.jpg',
    'assets/img/mv2.jpg',
    'assets/img/mv3.jpg',
    'assets/img/mv4.jpg'
  ];
  final List<String> img2 = <String>[
    'assets/img/iron.jpg',
    'assets/img/spider.png',
    'assets/img/torr.jpeg',
    'assets/img/cp.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // color: Colors.grey,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 350,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 170,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(10), // Image border radius
                        child: Column(
                          children: [
                            Image.asset(
                              '${img[index]}',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 130,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${entries[index]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              Text('Super Hero',
              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
              ),
            ],
          ),
          Container(
            // color: Colors.grey,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 200,
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
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5), 
                            child: Image.asset(
                              '${img2[index]}',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 90,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ' ${judul[index]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
