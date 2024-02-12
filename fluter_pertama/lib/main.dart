// import 'package:fluter_pertama/column_widget.dart';
import 'package:fluter_pertama/bokingflora.dart';
import 'package:fluter_pertama/container_widget.dart';
import 'package:fluter_pertama/latihankartun.dart';
import 'package:fluter_pertama/listflora.dart';
import 'package:fluter_pertama/login_screen.dart';
import 'package:fluter_pertama/profile.dart';
// import 'package:fluter_pertama/gridview/grid_basic.dart';
// import 'package:fluter_pertama/gridview/grid_builder.dart';
// import 'package:fluter_pertama/gridview/grid_count.dart';
// import 'package:fluter_pertama/gridview/grid_example.dart';
// import 'package:fluter_pertama/gridview/grid_latihan.dart';
// import 'package:fluter_pertama/gridview/latihan.dart';
// import 'package:fluter_pertama/latihan_satu.dart';
// import 'package:fluter_pertama/listview/list_basic.dart';
// import 'package:fluter_pertama/listview/list_builder.dart';
// import 'package:fluter_pertama/listview/list_separated.dart';
// import 'package:fluter_pertama/row_column.dart';
// import 'package:fluter_pertama/row_wigdet.dart';
// import 'package:fluter_pertama/screens/about_screen.dart';
// import 'package:fluter_pertama/screens/booking_screen.dart';
// import 'package:fluter_pertama/screens/form_screen.dart';
// import 'package:fluter_pertama/screens/home_screen.dart';
// import 'package:fluter_pertama/screens/login_screen.dart';
// import 'package:fluter_pertama/screens/profile_screen.dart';
// import 'package:fluter_pertama/screens/wisata_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ini Project Flutter Pertamaku",
      home: CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
  
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = BottomNavigationMenu();
    } else {
      child = LoginScreen();
    }

    return Scaffold(
      body: child,
    );
  }
}

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key});

  @override
  State<BottomNavigationMenu> createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  @override
  int _selectedTab = 0;

  List _pages = [
    LatihanKartun(),
    /// Notifications page
    FloraBoking(),

    /// Messages page
    ListFloraScreen(),

    ProfilePage()
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,  
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Kartun"),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment), label: "Beli Tiket"),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_stream), label: "List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Profil"),
        ],
      ),
    );
  }
}
