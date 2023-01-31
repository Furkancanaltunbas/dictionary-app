import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginButton extends StatefulWidget {
  Function() function;
  final Color? color;
  LoginButton({Key? key, required this.function, required this.color})
      : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.35),
      height: context.dynamicHeight(0.07),
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: RawMaterialButton(
        onPressed: widget.function,
        child: Text(
          "Login",
          style: TextStyle(
              fontFamily: "Lora",
              fontSize: context.dynamicHeight(0.035),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
