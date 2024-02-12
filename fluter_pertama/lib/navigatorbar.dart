// import 'package:fluter_pertama/bokingflora.dart';
// import 'package:fluter_pertama/form_screen.dart';
// import 'package:fluter_pertama/latihankartun.dart';
// import 'package:fluter_pertama/latihanlistview.dart';
// import 'package:fluter_pertama/listflora.dart';
// import 'package:flutter/material.dart';


// void main() => runApp(const MenuButon());

// class MenuButon extends StatelessWidget {
//   const MenuButon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       showSemanticsDebugger: false,
//       theme: ThemeData(useMaterial3: true),
//       home: const NavigationExample(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class NavigationExample extends StatefulWidget {
//   const NavigationExample({super.key});

//   @override
//   State<NavigationExample> createState() => _NavigationExampleState();
// }

// class _NavigationExampleState extends State<NavigationExample> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//         indicatorColor: Colors.amber,
//         selectedIndex: currentPageIndex,
//         destinations: const <Widget>[
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Badge(child: Icon(Icons.ad_units)),
//             label: 'Booking',
//           ),
//           NavigationDestination(
//             icon: Badge(
//               child: Icon(Icons.category_rounded),
//             ),
//             label: 'Marvel',
//           ),
//         ],
//       ),
//       body: <Widget>[
//         /// Home page
//          ListFloraScreen(),
//         /// Notifications page
//         FloraBoking(),
//         /// Messages page 
//        LatihanKartun(),
  
//       ][currentPageIndex],
//     );
//   }
// }
