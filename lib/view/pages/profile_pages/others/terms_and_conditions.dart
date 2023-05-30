import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../components/home_page_components/head_section.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor:AppColors.textcolor,
        leading:IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back,color: AppColors.blackcolor,),),
        title:Text(AppStrings.Terms_Conditions,style:TextStyle(
            color:AppColors.blackcolor
        ),),
        elevation:0,
      ),
      body:Column(
        children: [
          Padding(
            padding:EdgeInsets.only(left:5.w,),
            child: HeadSection(
              LeftText:AppStrings.Lorem_ipsum_dolor,
            RightText: "",
              fontsize_lefttext:15.sp,
              fontWeight_lefttext:FontWeight.w500,
            ),
          ) ,
          Container(
            padding:EdgeInsets.only(left:5.w,right:5.w),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                style:TextStyle(
                  color:AppColors.nutralcolor,
                  fontSize:12.sp,
                ),
              )
          ),
          Padding(
            padding:EdgeInsets.only(left:5.w,),
            child: HeadSection(
              LeftText:AppStrings.Lorem_ipsum_dolor,
              RightText: "",
              fontsize_lefttext:15.sp,
              fontWeight_lefttext:FontWeight.w500,
            ),
          ) ,
          Container(
              padding:EdgeInsets.only(left:5.w,right:5.w),
              child: Text(
                "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                style:TextStyle(
                  color:AppColors.nutralcolor,
                  fontSize:12.sp,
                ),
              )
          ),
          Container(
            color: AppColors.nutral400.withOpacity(0.2),
              margin:EdgeInsets.only(left:5.w,right:5.w,top:2.h,bottom:2.h),
              padding:EdgeInsets.only(left:5.w,right:5.w,bottom:1.5.h,top:1.5.h),
              child: Text(
                "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.  ",
                style:TextStyle(
                  color:AppColors.nutralcolor,
                  fontSize:12.sp,
                ),
              )
          ),
          Container(
              padding:EdgeInsets.only(left:5.w,right:5.w),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                style:TextStyle(
                  color:AppColors.nutralcolor,
                  fontSize:12.sp,
                ),
              )
          ),
        ],
      )
    );
  }
}
