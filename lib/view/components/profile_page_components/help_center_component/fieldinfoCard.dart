import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';

class FieldInfoCard extends StatefulWidget {
  FieldInfoCard({Key? key}) : super(key: key);

  @override
  State<FieldInfoCard> createState() => _FieldInfoCardState();
}

class _FieldInfoCardState extends State<FieldInfoCard> {
  bool onPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: (onPressed == false) ? 9.h : 30.h,
        width: 90.w,
        //alignment:(onPressed==false)?Alignment.center:Alignment.topCenter,
        padding: EdgeInsets.only(left: 2.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.nutral400)),
        child: Column(
          mainAxisAlignment:
              (onPressed) ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.Lorem_ipsum_dolor_sit_amet,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        onPressed = !onPressed;
                      });
                    },
                    icon:(onPressed==false)
                        ? Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColors.nutral400,
                    )
                        :Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColors.nutral400,
                    )
                ),
              ],
            ),
            (onPressed)
                ? Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
                    style: TextStyle(
                        color: AppColors.nutralcolor, fontSize: 12.sp),
                  )
                : SizedBox()
          ],
        ));
  }
}
