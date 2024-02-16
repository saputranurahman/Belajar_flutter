// edit_pasien_view.dart
import 'package:belajar_getx/app/data/models/kategori_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/modules/kategori/controllers/kategori_controller.dart';

class EditKategoriView extends StatelessWidget {
  final Kategori kategori;
  final KategoriController controller = Get.find();
  final TextEditingController namaController = TextEditingController();

  EditKategoriView({required this.kategori}) {
    namaController.text = kategori.nama;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            
           
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  // Always call the editPasien method without any conditional checks
                  controller.editKategori(
                    kategori,
                    namaController.text,
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (namaController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}