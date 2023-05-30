import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../components/home_page_components/head_section.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor:AppColors.textcolor,
        leading:IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back,color: AppColors.blackcolor,),),
        title:Text(AppStrings.Privacy_Policy,style:TextStyle(
            color:AppColors.blackcolor
        ),),
        elevation:0,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left:5.w,bottom:1.h),
              child:HeadSection(
                LeftText:AppStrings.Your_privacy_is_important,
                fontsize_lefttext:14.sp,
                fontWeight_lefttext:FontWeight.w500,
                RightText: "",
              ) ,
            ),
            Container(
              padding:EdgeInsets.only(left: 5.w,right:5.w),
              child:Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                style:TextStyle(
                  color:AppColors.nutralcolor,
                  fontSize: 12.sp
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.only(left: 5.w,right:5.w,top:2.h,bottom:2.h),
              child:Text(
                "Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                style:TextStyle(
                    color:AppColors.nutralcolor,
                    fontSize: 12.sp
                ),
              ),
            ),
            Container(
             margin:EdgeInsets.only(right:10.w),
             width:80.w,
             child: Text(AppStrings.Data_controllers,
                  style:TextStyle(
                    fontSize:14.sp,
                    fontWeight:FontWeight.w500,
                  ),


                ),
           ) ,
            Container(
              padding:EdgeInsets.only(left: 5.w,right:5.w,top:2.h,bottom:2.h),
              child:Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                style:TextStyle(
                    color:AppColors.nutralcolor,
                    fontSize: 12.sp
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
