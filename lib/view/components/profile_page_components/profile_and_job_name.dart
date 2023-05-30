import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';

class ProfileAndJobName extends StatelessWidget {
  const ProfileAndJobName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Text("Ahmed Mohamed Ezzat",style:TextStyle(fontSize:16.sp,fontWeight:FontWeight.w500,color:AppColors.blackcolor),),
                SizedBox(height:1.h,),
                Text("Senior UI/UX Designer",style:TextStyle(fontSize:13.sp,color:AppColors.nutralcolor),)
              ],
            );

  }
}
