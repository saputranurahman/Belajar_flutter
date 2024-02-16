// pasien_controller.dart
import 'dart:convert';

// import 'package:belajar_getx/app/modules/pasien/views/show_pasien_view.dart';
import 'package:belajar_getx/app/modules/kategori/views/show_kategori_view.dart';
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/data/models/kategori_model.dart';
import 'package:belajar_getx/app/providers/api.dart';
import 'package:http/http.dart' as http;

class KategoriController extends GetxController {
  var kategoriList = <Kategori>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/kategori';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['data'];
        kategoriList
            .assignAll(jsonResponse.map((model) => Kategori.fromJson(model)));
      } else {
        throw Exception('Failed to load pasien');
      }
    } catch (e) {
      print('Error during fetching pasien: $e');
    }
  }

  //  fungsi create,
  Future<void> tambahKategori(
    String nama,
  ) async {
    try {
      if (nama.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/kategori';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'nama': nama,
        },
      );

      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'Pasien berhasil ditambahkan');
        fetchData();
        Get.offAndToNamed(Routes.BOTTOM_MENU); // Redirect ke halaman pasien
      } else {
        throw Exception('Failed to add pasien');
      }
    } catch (e) {
      print('Error during tambah pasien: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // edit pasien
  Future<void> editKategori(
    Kategori kategori,
    String nama,
  ) async {
    try {
      if (nama.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/kategori/${kategori.id}';
      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'nama': nama,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Kategori berhasil diubah');
        fetchData(); // Refresh the kategoriList
        Get.offAndToNamed(Routes.BOTTOM_MENU);
      } else {
        throw Exception('Failed to edit pasien');
      }
    } catch (e) {
      print('Error during edit pasien: $e');
    }
  }

  // show pasien
  void showKategoriDetails(Kategori kategori) {
    Get.to(() => DetailKategoriView(kategori: kategori));
  }

  // delete pasien
  Future<void> deleteKategori(Kategori kategori) async {
    try {
      var apiUrl = '${Api.baseUrl}/kategori/${kategori.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Pasien berhasil dihapus');
        fetchData();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete pasien');
      }
    } catch (e) {
      print('Error during delete Kategori: $e');
    }
  }
}