import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';

class ProfileInfoField extends StatelessWidget {
  const ProfileInfoField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            height:8.h,
            margin:EdgeInsets.only(left:5.w,right:5.w),
            padding:EdgeInsets.all(8),
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              color:AppColors.nutral201.withOpacity(.2),
            ),

            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      AppStrings.Applied,
                      style: TextStyle(
                          color: AppColors.nutralcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "47",
                      style: TextStyle(
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                  child: VerticalDivider(
                    color: AppColors.nutral400,
                    thickness: 1,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      AppStrings.Reviewed,
                      style: TextStyle(
                          color: AppColors.nutralcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "47",
                      style: TextStyle(
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                  child: VerticalDivider(
                    color: AppColors.nutral400,
                    thickness: 1,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      AppStrings.Contacted,
                      style: TextStyle(
                          color: AppColors.nutralcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "47",
                      style: TextStyle(
                          color: AppColors.blackcolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
