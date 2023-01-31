import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_word/core/components/buttons/save_button.dart';
import 'package:my_word/core/service/status_service.dart';

import '../../core/constants/colors/colors.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController turkceKelime = TextEditingController();
  TextEditingController ingilizceKelime = TextEditingController();

  StatusService _statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      appBar: AppBar(
        title: Text("Kelime Ekle",
            style: TextStyle(
                fontSize: context.dynamicHeight(0.06),
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower')),
        centerTitle: true,
        backgroundColor: containerColor,
      ),
      body: Center(
        child: SizedBox(
          height: context.dynamicHeight(0.6),
          width: context.dynamicWidth(0.8),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "İngilizce Kelime",
                  style: TextStyle(
                      fontSize: context.dynamicHeight(0.04),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower'),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    controller: ingilizceKelime,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: "...",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                Text(
                  "Türkçe Kelime",
                  style: TextStyle(
                      fontSize: context.dynamicHeight(0.04),
                      color: Colors.white,
                      fontFamily: 'IndieFlower',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    controller: turkceKelime,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: "...",
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: context.dynamicWidth(0.2),
                ),
              SaveButton(function: (){
                _statusService.addStatus(
                  turkceKelime.text, ingilizceKelime.text, false);})
              ],
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7.0,
                      offset: Offset(10, 15),
                      color: Colors.black)
                ],
                color: containerColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
        ),
      ),
    );
  }
}
