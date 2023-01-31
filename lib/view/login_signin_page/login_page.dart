import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_word/core/components/buttons/login_button.dart';
import 'package:my_word/core/components/buttons/signin_button.dart';
import 'package:my_word/core/components/buttons/text_button.dart';
import 'package:my_word/core/service/auth_service.dart';
import 'package:my_word/view/login_signin_page/signin_page.dart';
import 'package:my_word/view/user_interface_page/bottom_navigator_page.dart';
import 'package:my_word/view/user_interface_page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/constants/colors/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: containerColor,
            child: Column(
              children: [
                SizedBox(
                  height: context.dynamicHeight(0.03),
                ),
                Text(
                  "İNGİLİZCE",
                  style: TextStyle(
                      fontFamily: "Lora",
                      color: Colors.white,
                      fontSize: context.dynamicHeight(0.055),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "SÖZLÜĞÜM",
                  style: TextStyle(
                      fontFamily: "Lora",
                      color: Colors.white,
                      fontSize: context.dynamicHeight(0.06),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                Container(
                  // ignore: sort_child_properties_last
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.dynamicHeight(0.05),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            fontFamily: "Lora",
                            fontWeight: FontWeight.bold,
                            fontSize: context.dynamicHeight(0.05),
                            color: containerColor),
                      ),
                      SizedBox(
                        height: context.dynamicHeight(0.05),
                      ),
                      Text(
                        "Kullanıcı Adınız",
                        style: TextStyle(
                            fontFamily: "Lora",
                            fontSize: context.dynamicHeight(0.025),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: context.dynamicHeight(0.02)),
                      Padding(
                        padding: EdgeInsets.only(right: 30, left: 30),
                        child: TextField(
                          controller: _emailController,
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
                        height: context.dynamicHeight(0.03),
                      ),
                      Text(
                        "Şifre",
                        style: TextStyle(
                            fontFamily: "Lora",
                            fontSize: context.dynamicHeight(0.025),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: context.dynamicHeight(0.02)),
                      Padding(
                        padding: EdgeInsets.only(right: 30, left: 30),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
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
                        height: context.dynamicHeight(0.1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginButton(
                              color: myWhite,
                              function: () {
                                _authService
                                    .signIn(_emailController.text,
                                        _passwordController.text)
                                    .then((value) {
                                  return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavigatorPage()));
                                }).catchError((dynamic error) {
                                  if (error.code.contains("invalid-email")) {
                                    
                                        _buildErrorMessage("Mail adresi geçersizdir.");
                                  }
                                  if (error.code.contains("user-not-found")) {
                                    
                                        _buildErrorMessage("Bu mail adresine ait kullanıcı bulunamadı.");
                                  }
                                  if (error.code.contains("wrong-password")) {
                                   
                                         _buildErrorMessage("Hatalı sifre.");
                                  }

                                  if(error.code.contains("unknown")){
                                    _buildErrorMessage("Lütfen bilgilerinizi giriniz.");
                                  }
                                  if(error.code.contains("weak-password")){
                                    _buildErrorMessage("Şifre en az 6 karakter olmalıdır.");
                                  }
                                });
                              }),
                          SigninButton(
                            color: containerColor,
                            function: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SigninPage()));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  width: context.dynamicWidth(1.0),
                  height: context.dynamicHeight(0.75),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 100.0, color: darkBlue)],
                    color: myWhite,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

     

  }
}
 _buildErrorMessage(String text){
         Fluttertoast.showToast(
                                        msg: text,
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: myWhite,
                                        textColor: Colors.red,
                                        fontSize: 18.0);
                                  }
      
