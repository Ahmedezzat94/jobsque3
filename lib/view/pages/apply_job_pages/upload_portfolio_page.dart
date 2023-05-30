import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../components/job_details_components/add_file_field.dart';
import '../../components/job_details_components/uploadCV_feild.dart';

class UploadPortfolioPage extends StatelessWidget {
  const UploadPortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding:EdgeInsets.only(left:5.w,top:2.h,bottom: 1.h),
              child: Text(AppStrings.Upload_portfolio,
                style:TextStyle(fontWeight:FontWeight.w600,fontSize:14.sp),),

            ),
          ],
        ),
        Padding(
          padding:EdgeInsets.only(right:41.w,bottom:2.h),
          child:Text(AppStrings.Fill_in_your_bio_data_correctly,
            style:TextStyle(color:AppColors.nutralcolor),),
        ),
        Padding(
          padding:EdgeInsets.only(right:70.0.w,top:2.h,bottom: 1.h),
          child: Text(AppStrings.Upload_CV,
            style:TextStyle(fontWeight:FontWeight.w500,fontSize:12.sp,color:AppColors.blackcolor),),
        ),
       UploadCvField(),
        Padding(
          padding:EdgeInsets.only(top:3.h,right:72.w,bottom:2.h),
          child: Text(AppStrings.Other_File,
            style:TextStyle(fontWeight:FontWeight.w500,fontSize:12.sp),),

        ),
        AddFileField()

      ]
    );
  }
}
