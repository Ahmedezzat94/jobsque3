import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../widgets/tab_button.dart';

class JobsBar extends StatelessWidget {
  const JobsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      width: 87.w,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 2.w,
        ),
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => TabButton(
          padding: EdgeInsets.only(left: 4.w),
          // height:4.h,
          width: 25.w,
          color: AppColors.secondrycolor,
          child: Row(
            children: [
              Text(
                AppStrings.Remote,
                style: TextStyle(color: AppColors.textcolor, fontSize: 10.sp),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.nutral300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
