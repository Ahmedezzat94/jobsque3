import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../components/home_page_components/head_section.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor:AppColors.textcolor,
        leading:IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined,color:AppColors.blackcolor,),
        ),
        title:Text(AppStrings.Notification,style:TextStyle(
          color:AppColors.blackcolor
        ),),
        elevation: 0,
      ),
      body:Column(
        children: [
          Container(
            padding:EdgeInsets.only(left:6.w ),
            height:5.h,
            width: double.infinity,
            decoration:BoxDecoration(
              color:AppColors.spikcolor.withOpacity(0.1),
              border:Border.all(color: AppColors.spikcolor.withOpacity(.2))
            ),
            child: HeadSection(LeftText:AppStrings.New,
              LeftTextcolor:AppColors.nutralcolor ,
              RightText: "",),
          ),
          SizedBox(
            height:40.h,
            child:ListView.separated(
                itemCount: 4,
              itemBuilder: (context,index) => ListTile(
                leading:SvgPicture.asset(AppImages.zoom_icon,height: 5.h,),
                title:Text("Zoom",style:TextStyle(
                  fontSize:10.sp,
                  fontWeight:FontWeight.w500,
                  color:AppColors.blackcolor,
                ),) ,
                subtitle:Padding(
                  padding:EdgeInsets.only(top:1.h),
                  child: Text("Posted new design jops"),
                ) ,
                trailing:Text("10.00 Pm"),
              ),
              separatorBuilder: (context,index) => Divider(
                color: AppColors.nutralcolor,
                endIndent:5.w ,
                indent:5.w,
              ),
            ),
          ),
          Container(
            padding:EdgeInsets.only(left:6.w ),
            height:5.h,
            width: double.infinity,
            decoration:BoxDecoration(
                color:AppColors.spikcolor.withOpacity(0.1),
                border:Border.all(color: AppColors.spikcolor.withOpacity(.2))
            ),
            child: HeadSection(LeftText:AppStrings.Yesterday,
              LeftTextcolor:AppColors.nutralcolor ,
              RightText: "",),
          ),
          SizedBox(
            height:30.h,
            child:ListView.separated(
              itemCount: 2,
              itemBuilder: (context,index) => ListTile(
                leading:(index==0)?SvgPicture.asset(AppImages.Email_notification_logo,height: 5.h,)
                :SvgPicture.asset(AppImages.notification_search_Logo,height: 5.h,),
                title:Text("Zoom",style:TextStyle(
                  fontSize:10.sp,
                  fontWeight:FontWeight.w500,
                  color:AppColors.blackcolor,
                ),) ,
                subtitle:Padding(
                  padding:EdgeInsets.only(top:1.h),
                  child: Text("Posted new design jops"),
                ) ,
                trailing:Text("10.00 Pm"),
              ),
              separatorBuilder: (context,index) => Divider(
                color: AppColors.nutralcolor,
                endIndent:5.w ,
                indent:5.w,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
