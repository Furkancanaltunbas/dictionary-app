import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_word/core/constants/colors/colors.dart';

class CardWidget extends StatefulWidget {
  String textIngilizce;
  String textTurkce;
  bool durum;
  Function() function;
  CardWidget(
      {Key? key,
      required this.textIngilizce,
      required this.textTurkce,
      required this.function,
      required this.durum})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      width: context.dynamicWidth(1.0),
      child: Card(
        color: containerColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

          Text(
            widget.textIngilizce,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 20, color: myWhite),
          ),
              SizedBox(width: context.dynamicWidth(0.2),),
          Text(
            widget.textTurkce,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 20, color: myWhite),
          ),
              SizedBox(width: context.dynamicWidth(0.1),),
          IconButton(
              onPressed: widget.function,
              icon: Icon(
                Icons.star,
                color: widget.durum ? myYellow : myWhite,
              )),
              SizedBox(width: context.dynamicWidth(0.1),),
        ]),
      ),
    );
  }
}
