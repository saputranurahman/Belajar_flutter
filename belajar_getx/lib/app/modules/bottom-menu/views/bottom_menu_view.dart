import 'package:belajar_getx/app/modules/counter/views/counter_view.dart';
import 'package:belajar_getx/app/modules/home/views/home_view.dart';
import 'package:belajar_getx/app/modules/profil/views/profil_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_menu_controller.dart';

class BottomMenuView extends GetView<BottomMenuController> {
  const BottomMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [HomeView(), CounterView(), ProfilView()],
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}