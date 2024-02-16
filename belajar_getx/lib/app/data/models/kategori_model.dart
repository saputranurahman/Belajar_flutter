// Kategori_model.dart
class Kategori {
  int id;
  String nama;

  Kategori({
    required this.id,
    required this.nama,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: json['id'],
      nama: json['nama_kategori'],
    );
  }
}