import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(top : 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          size: 23,
                        ),
                        Text("Home")
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_business_outlined,
                          size: 23,
                        ),
                        Text("Tambah")
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          size: 23,
                        ),
                        Text("Profile")
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}