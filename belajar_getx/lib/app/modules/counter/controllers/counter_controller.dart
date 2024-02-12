import 'package:get/get.dart';
import 'package:flutter/material.dart';
class CounterController extends GetxController {
  var count = 1.obs; // Inisialisasi count dengan 1

  void increment() {
    if (count < 100) {
      count++;
    } else {
      Get.snackbar(
        'Error',
        'Nilai tidak dapat melebihi 100',
        backgroundColor: const Color.fromARGB(76, 0, 0, 0),
        colorText: Colors.black,
      );
    }
  }

  void decrement() {
    if (count > 1) {
      count--;
    } else {
      Get.snackbar(
        'Error',
        'Nilai tidak dapat kurang dari 1',
        backgroundColor: const Color.fromARGB(82, 0, 0, 0),
        colorText: Colors.black,
      );
    }
  }
}
