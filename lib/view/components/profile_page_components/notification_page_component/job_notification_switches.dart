import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_strings.dart';
import '../../../widgets/flutter_toggel_switch.dart';



class JobNotificationSwitches extends StatelessWidget {
  JobNotificationSwitches({Key? key}) : super(key: key);

  List switchesName = [
    AppStrings.Your_Job_Search_Alert,
    AppStrings.Job_Application_Update,
    AppStrings.Job_Application_Reminders,
    AppStrings.Jobs_You_May_Be_Interested_In,
    AppStrings.Job_Seeker_Updates
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:3.w,right:4.w),
      child: ListView.separated(
        padding:EdgeInsets.only(top:3.h,bottom:3.h,left:2.w,right: 2.w),
        //physics:NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
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
