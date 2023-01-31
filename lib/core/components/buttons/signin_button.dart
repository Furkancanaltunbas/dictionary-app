import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SigninButton extends StatefulWidget {
  Function() function;
  final Color? color;
  SigninButton({Key? key, required this.color, required this.function})
      : super(key: key);

  @override
  State<SigninButton> createState() => _SigninButtonState();
}

class _SigninButtonState extends State<SigninButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.35),
      height: context.dynamicHeight(0.07),
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: RawMaterialButton(
        onPressed: widget.function,
        child: Text(
          "Sign in",
          style: TextStyle(
              fontFamily: "Lora",
              fontSize: context.dynamicHeight(0.035),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
