import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';

class SavedBottomSheet extends StatelessWidget {
  const SavedBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      color: AppColors.textcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            thickness: 1.w,
            color: AppColors.blackcolor,
            endIndent: 43.w,
            indent: 43.w,
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            height: 6.h,
            width: 85.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.nutral300),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.directbox_notif),
                    SizedBox(width:2.w,),
                    Text(
                      AppStrings.Apply_Job,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 3.5.w,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            height: 6.h,
            width: 85.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.nutral300),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.upload_icon),
                    SizedBox(width:2.w,),
                    Text(
                      AppStrings.Share_via,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 3.5.w,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            height: 6.h,
            width: 85.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.nutral300),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.archive_minus),
                    SizedBox(width:2.w,),
                    Text(
                      AppStrings.Cancel_save,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 3.5.w,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
