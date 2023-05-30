
import 'package:flutter/material.dart';


import '../../../core/utilities/app_colors.dart';

class HeadSection extends StatelessWidget {
  String? LeftText;
  Color? LeftTextcolor;
  double? fontsize_lefttext;
  FontWeight? fontWeight_lefttext;
  String? RightText;
  Function()? onTap;

   HeadSection({
     Key? key,
     this.LeftText,
     this.LeftTextcolor,
     this.fontsize_lefttext,
     this.fontWeight_lefttext,
     this.RightText,
     this.onTap
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LeftText!,
        style:TextStyle(
          fontSize:fontsize_lefttext,
          fontWeight:FontWeight.w600,
          color:LeftTextcolor
        ),
        ),
        TextButton(
            onPressed:onTap,
            child:Text(
                RightText!,
              style:TextStyle(
                color:AppColors.primrycolor

              ),
            )
        )
      ],
    );
  }
}
