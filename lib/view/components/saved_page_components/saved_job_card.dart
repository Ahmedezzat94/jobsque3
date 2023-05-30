import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import 'saved_bottom_sheet.dart';

class SavedJobCard extends StatelessWidget {
  const SavedJobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 12.h,
      child: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(top:1.h,left:5.w,right:5.w,bottom:2.h),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.zoom_icon,height:5.h,),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:3.w,bottom:5),
                          child: Text("${AppStrings.Senior} ui desiner",style:TextStyle(
                              fontSize: 14.sp,color:AppColors.blackcolor
                          ),),
                        ),
                        const Text("zoom.united staate",style:TextStyle(
                            color:AppColors.nutralcolor
                        ),)
                      ],
                    ),
                  ],
                ),
                InkWell(
                    onTap: (){
                      showModalBottomSheet(context: context,
                          builder: (context)=>const SavedBottomSheet());
                    },
                    child: SvgPicture.asset(AppImages.more_vert)),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.only(left:5.w,right:5.w,),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text("Posted 2 days ago",style:TextStyle(color: AppColors.nutralcolor,fontSize:10.sp),),
                Row(
                  children: [
                    Icon(Icons.access_time_outlined,color:AppColors.successcolor,size:5.w,),
                    SizedBox(width:1.h,),
                    Text("Be an early applicant",style:TextStyle(color: AppColors.nutralcolor,fontSize:10.sp),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
