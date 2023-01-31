import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kartal/kartal.dart';
import 'package:my_word/core/service/auth_service.dart';
import 'package:my_word/view/login_signin_page/login_page.dart';

import '../../core/components/buttons/login_button.dart';
import '../../core/components/buttons/signin_button.dart';
import '../../core/constants/colors/colors.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordTekrarController =
      TextEditingController();

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
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.dynamicHeight(0.05),
                      ),
                      Text(
                        "Sign in",
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
                        "Gmail",
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
                        height: context.dynamicHeight(0.01),
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
                          controller: _nameController,
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
                        height: context.dynamicHeight(0.01),
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
                        height: context.dynamicHeight(0.01),
                      ),
                      Text(
                        "Şifre Tekrar",
                        style: TextStyle(
                            fontFamily: "Lora",
                            fontSize: context.dynamicHeight(0.025),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: context.dynamicHeight(0.02)),
                      Padding(
                        padding: EdgeInsets.only(right: 30, left: 30),
                        child: TextField(
                          controller: _passwordTekrarController,
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
                              color: containerColor,
                              function: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }),
                          SigninButton(
                            color: myWhite,
                            function: () {
                              _authService
                                  .createPerson(
                                      _nameController.text,
                                      _emailController.text,
                                      _passwordController.text)
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SigninPage()));
                              }).catchError((dynamic error){
                                if(error.code.contains("invalid-email")){
                                  _buildErrorMessage("Mail adresi geçersizdir.");
                                }
                                if(error.code.contains("unknown")){
                                  _buildErrorMessage("Lütfen bilgilerinizi giriniz.");
                                }
                                if(error.code.contains("weak-password")){
                                  _buildErrorMessage("Şifre en az 6 karakter olmalıdır.");
                                }


                                print(error);
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  width: context.dynamicWidth(1.0),
                  height: context.dynamicHeight(1.0),
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
