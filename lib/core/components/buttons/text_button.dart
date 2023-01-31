import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TextButton extends StatefulWidget {
  Function() function;
  TextButton({Key? key, required this.function}) : super(key: key);

  @override
  State<TextButton> createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.01),
      width: context.dynamicWidth(0.01),
      child: RawMaterialButton(
        onPressed: widget.function,
        child: Text(
          "Sifremi Unutum !",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
