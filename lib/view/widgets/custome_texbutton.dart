import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget{
  String? text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  Function()? onPressed;

  CustomTextButton({
    this.onPressed,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.color
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:onPressed,
        child: Text("${text}",
          style:TextStyle(
              fontSize:fontSize,
              fontWeight:fontWeight,
              color: color
          ),));
  }

}