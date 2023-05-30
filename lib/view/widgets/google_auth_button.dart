import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/utilities/app_assets.dart';
import '../../core/utilities/app_colors.dart';

class GoogleAuthButton extends StatelessWidget {
  double? height;
  double? width;
  double? fontsize;
  FontWeight? fontWeight;
  Color? color;
  Color? textcolor;
  String? text;
  Function()? onTab;

  GoogleAuthButton(
      {this.height,
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
          border:Border.all(color:AppColors.nutralcolor),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.googleicon),
            SizedBox(width:2.w,),
            Center(
              child: Text(
                "${text}",
                style: TextStyle(
                    fontSize: fontsize,
                    fontWeight: fontWeight,
                    color: textcolor
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
