import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';

class EmployeJobFields extends StatelessWidget {
  const EmployeJobFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "6 Employees for",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 7.0.w),
              child: Text(
                "UI/Ux Designer",
                style: TextStyle(color: AppColors.nutralcolor),
              ),
            )
          ],
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(2.w),
            height: 5.h,
            width: 40.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.nutral300),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("UI/Ux Designer"),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        )
      ],
    );
  }
}
