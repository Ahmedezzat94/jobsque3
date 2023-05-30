import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../components/home_page_components/head_section.dart';
import '../../../components/profile_page_components/notification_page_component/job_notification_switches.dart';
import '../../../components/profile_page_components/notification_page_component/other_nitification_switches.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor: AppColors.textcolor,
        leading:IconButton(onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),
        ),
        title: Text(AppStrings.Notification,style:TextStyle(
          color:AppColors.blackcolor
        ),),
        elevation:0,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:2.h,),
            //job notification Head.
            Container(
              height:5.h,
              padding:EdgeInsets.only(left:5.w),
              decoration:BoxDecoration(
                border:Border.all(color:AppColors.nutral300),
                color: AppColors.nutralcolor.withOpacity(0.2),
              ),
              child:HeadSection(
                LeftText: AppStrings.Job_notification,
                RightText:"",
                LeftTextcolor: AppColors.nutralcolor,
              ),
            ),
            JobNotificationSwitches(),
            //other notification Head.
            Container(
              height:5.h,
              padding:EdgeInsets.only(left:5.w),
              decoration:BoxDecoration(
                border:Border.all(color:AppColors.nutral300),
                color: AppColors.nutralcolor.withOpacity(0.2),
              ),
              child:HeadSection(
                LeftText: AppStrings.Other_notification,
                RightText:"",
                LeftTextcolor: AppColors.nutralcolor,
              ),
            ),
            OtherNotificationSwitches()
          ],
        ),
      )
    );
  }
}
