import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  double? height;
  double? width;
  double? fontsize;
  FontWeight? fontWeight;
  Color? color;
  Color? textcolor;
  String? text;
  Widget? child;
  Function()? onTab;
  EdgeInsetsGeometry? padding;

  TabButton(
      {this.height,
      this.width,
      this.color,
      this.textcolor,
      this.onTab,
      this.text,
      this.fontsize,
      this.fontWeight,
      this.child,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
          padding: padding,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: child),
    );
  }
}
