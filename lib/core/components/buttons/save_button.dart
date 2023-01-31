import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_word/core/constants/colors/colors.dart';

class SaveButton extends StatefulWidget {
  Function() function;
  SaveButton({Key? key,required this.function}) : super(key: key);

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.6),
      height: context.dynamicHeight(0.07),
      decoration: BoxDecoration(
          color: myWhite,
          borderRadius: BorderRadius.circular(20.0)),
      child: RawMaterialButton(
        onPressed: widget.function,
        child: Text(
          "Kaydet",
          style: TextStyle(
            color: containerColor,
              fontFamily: "IndieFlower",
              fontSize: context.dynamicHeight(0.035),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}