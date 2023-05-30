import 'package:flutter/material.dart';

import '../../core/utilities/app_colors.dart';


class MainButton extends StatelessWidget {
  double? height;
  double? width;
  double? fontsize;
  FontWeight? fontWeight;
  Color? color;
  Color? textcolor;
  String? text;
  Function()? onTab;
   bool? isLoading;

  MainButton(
      {
        this.height,
        this.isLoading,
      this.width,
      this.color,
      this.textcolor,
      this.onTab,
      this.text,
      this.fontsize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: (isLoading==true)?const CircularProgressIndicator(color:AppColors.textcolor,):Text(
            "${text}",
            style: TextStyle(
                fontSize: fontsize, fontWeight: fontWeight, color: textcolor),
          ),
        ),
      ),
    );
  }
}
