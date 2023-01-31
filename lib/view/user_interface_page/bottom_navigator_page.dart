import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_word/view/user_interface_page/add_Page.dart';
import 'package:my_word/view/user_interface_page/detail_page.dart';
import 'package:my_word/view/user_interface_page/home_page.dart';

import '../../core/constants/colors/colors.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({super.key});

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int index = 1;

  final screens = [
    AddPage(),
    HomePage(),
    DetailPage(),
  ];

  bool aramaYapliyorMu = false;
  String aramaKelimesi = "";

  //var refKelimeler = FirebaseDatabase.instance.reference().child("kelimeler");

  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(
        Icons.add_circle,
        color: Colors.white,
      ),
      Icon(
        Icons.home,
        color: Colors.white,
      ),
      Icon(
        Icons.star,
        color: Colors.white,
      ),
    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: myWhite,
        color: containerColor,
        height: context.dynamicHeight(0.07),
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
