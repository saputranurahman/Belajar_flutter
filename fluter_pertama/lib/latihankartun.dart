import 'package:flutter/material.dart';

class LatihanKartun extends StatelessWidget {
  LatihanKartun({Key? key}) : super(key: key);

  final List<String> judul = [
    'Rudy Tabootie',
    'Snap',
    'Penny Sanchez',
    'Mr. Wilter',
    'Reina Rapsheeba',
    'Dr. Sanchez',
  ];

  final List<String> img = [
    'assets/img/kar1.jpg',
    'assets/img/kar2.jpg',
    'assets/img/kar3.jpg',
    'assets/img/kar4.jpg',
  ];

  final List<String> img2 = [
    'assets/img/ga1.jpg',
    'assets/img/ga2.jpg',
    'assets/img/ga3.jpg',
    'assets/img/ga4.jpg',
  ];

  final List<String> kar = [
    'assets/img/p1.jpg',
    'assets/img/p2.jpg',
    'assets/img/p3.jpg',
    'assets/img/p4.jpg',
    'assets/img/p5.jpg',
    'assets/img/p6.jpg',
  ];

  final List<String> des = [
    'Rudolph Bartholomew "Rudy" Tabootie adalah karakter utama pria dari ChalkZone. Dia disuarakan oleh Elizabeth Daily, dicantumkan sebagai E.G. Daily. Rudy dan karakter manusia lainnya tinggal di Plainville.',
    'Snap adalah gambar humanoid biru kecil yang dibuat oleh Rudy, dan dia adalah sahabat Rudy. Rudy membuat Snap ketika dia berusia 8 tahun dengan menggambarnya di papan tulis melawan Bully Nerd, dan keduanya terhapus ke dalam ChalkZone. Namun, terungkap dalam "Family Von Snap" bahwa Rudy pertama kali menggambar Snap dan sepupunya pada usia yang lebih muda.',
    'Penelope Victoria “Penny” Sanchez adalah seorang gadis muda Latina yang merupakan salah satu teman sekelas Rudy dan sahabat manusianya. Penny disuarakan oleh Hynden Walch, dengan suara nyanyiannya disediakan oleh Robbyn Kirmsse.',
    'Horace T. Wilter adalah guru Rudy dan Penny yang tidak puas dan salah satu antagonis sekunder dalam serial ini. Dia pernah ditangkap polisi di episode season 1 di Chalkzone',
    'Ratu Rapsheeba adalah gambar kapur humanoid Afrika-Amerika yang tingginya hampir sama dengan Snap. Dia memiliki pinggang kecil, bibir ditutupi lipstik merah, mata hijau dan rambut panjang berwarna hazelnut. Dia mengenakan kemeja putih dengan celana dan sepatu hitam, serta topi hitam di kepalanya. Dalam beberapa episode, dia mengenakan atasan perut berwarna putih dan celana pendek hitam tanpa topi sama sekali.',
    'Nyonya Sanchez atau Dr. Sanchez adalah ibu dari Penny Sanchez . Dia seorang dokter hewan dan menjalankan klinik di halaman belakang rumahnya. Dia pernah disebut oleh kliennya sebagai dokter hewan terbaik di Plainville . Dia memiliki aksen Meksiko yang kental dan menonjolkan pidatonya dengan kata dan frasa berbahasa Spanyol.',
  ];
  var data = 1;
  var color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chalkzone',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 210,
              child: ListView.builder(
                physics: PageScrollPhysics(),
                itemCount: img.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 300,
                      height: 210,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          '${img[index]}',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  'Pemeran',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemCount: kar.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 110,
                      height: 160,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Handle tap on the pemeran item (optional)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPemeran(
                                    nama: judul[index],
                                    gambar: kar[index],
                                    deskripsi: des[index],
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                '${kar[index]}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 90,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
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
                },
              ),
            ),
            Column(
              children: [
                Text(
                  'Galeri',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 170,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: img2.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      color: Colors.purple[color += 100],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          img2[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPemeran extends StatelessWidget {
  final String nama;
  final String gambar;
  final String deskripsi;
  DetailPemeran({required this.nama, required this.gambar, required this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    gambar,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              nama,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  deskripsi,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Add more details about the actor if needed
          ],
        ),
      ),
    );
  }
}
