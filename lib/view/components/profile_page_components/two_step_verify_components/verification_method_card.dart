import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';

class VerificationMethodCard extends StatelessWidget {
  const VerificationMethodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:EdgeInsets.only(left:5.w,bottom:1.h),
          child: Row(
            children: [
              Text(AppStrings.Select_a_verification_method,
                style:TextStyle(
                  fontSize:12.sp,
                  fontWeight:FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        Container(
          height:9.h,
          width:90.w,
          decoration:BoxDecoration(
            border:Border.all(
              color:AppColors.nutral300,
            ),
            borderRadius:BorderRadius.circular(10)
          ),
          child:Padding(
            padding:EdgeInsets.only(left:3.w),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.Telephone_number,style:TextStyle(
                  color:AppColors.blackcolor
                ) ,),
                IconButton(
                    onPressed: (){},
                    icon:Icon(Icons.keyboard_arrow_down_outlined))
              ],
            ),
          ),
        ),
        SizedBox(height:2.h,),
        Container(
          width:90.w,
          child:Text(
            AppStrings.Note_Turning,
            style:TextStyle(
              color:AppColors.nutralcolor
            ),
          ),
        )
      ],
    );
  }
}
