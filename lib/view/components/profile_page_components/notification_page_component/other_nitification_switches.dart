import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_strings.dart';
import '../../../widgets/flutter_toggel_switch.dart';



class OtherNotificationSwitches extends StatelessWidget {
  OtherNotificationSwitches({Key? key}) : super(key: key);

  List switchesName = [
    AppStrings.Show_Profile,
    AppStrings.All_Message,
    AppStrings.Message_Nudges,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:3.w,right:4.w),
      child: ListView.separated(
        padding:EdgeInsets.only(top:3.h,bottom:3.h,left:2.w,right: 2.w),
        //physics:NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        separatorBuilder: (context,index) => Divider(),
        itemBuilder: (context,index) => Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:EdgeInsets.only(top:1.h,bottom:3.h),
              child: Row(
                children: [
                  Text(switchesName.elementAt(index),
                    style:TextStyle(
                        fontSize:13.sp
                    ),
                  ),
                ],
              ),
            ),
            FlutterSwitch(isSelected:false,)

          ],
        ),
      ),
    );

  }
}
