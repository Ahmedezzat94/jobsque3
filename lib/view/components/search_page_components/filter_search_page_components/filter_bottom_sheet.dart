import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_assets.dart';
import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/main_button.dart';
import 'pick_job_type_field.dart';


class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:3.h,),
        Padding(
          padding:EdgeInsets.only(left:10.0,right:10.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              },
                icon:Icon(Icons.arrow_back_outlined,color:AppColors.blackcolor),),
              Text(AppStrings.Set_Filter,style:TextStyle(
                  fontSize:15.sp,
                  fontWeight:FontWeight.w500
              ),),
              TextButton(
                  onPressed: (){},
                  child: Text(AppStrings.Reset,style:TextStyle(color:AppColors.primrycolor),)
              )
            ],
          ),
        ),
        Padding(
          padding:EdgeInsets.only(left:20.0,top:1.h,bottom:1.h),
          child: Row(
            children: [
              Text(AppStrings.Job_Tittle,style:TextStyle(fontWeight:FontWeight.w500,fontSize:15.sp),)
            ],
          ),
        ),
        CustomTextField(
          icon:SvgPicture.asset(AppImages.black_briefcase,),
          onTap:(){} ,
          onChange:(){} ,
          onSubmit:(){} ,
        ),
        Padding(
          padding:EdgeInsets.only(left:20.0,bottom:1.h,top:2.h),
          child: Row(
            children: [
              Text(AppStrings.Location,style:TextStyle(fontWeight:FontWeight.w500,fontSize:15.sp),)
            ],
          ),
        ),
        CustomTextField(
          icon:SvgPicture.asset(AppImages.location,),
        ),
        Padding(
          padding:EdgeInsets.only(left:20.0,bottom:1.h,top:2.h),
          child: Row(
            children: [
              Text(AppStrings.Salary,style:TextStyle(fontWeight:FontWeight.w500,fontSize:15.sp),)
            ],
          ),
        ),
        CustomTextField(
          icon:SvgPicture.asset(AppImages.dollar,),
        ),
        Padding(
          padding:EdgeInsets.only(left:20.0,bottom:3.h,top:2.h),
          child: Row(
            children: [
              Text(AppStrings.Job_Type,style:TextStyle(fontWeight:FontWeight.w500,fontSize:15.sp),)
            ],
          ),
        ),
        Wrap(
            spacing: 10,
            runSpacing:15,
            children:[
              PickJobTypeField(isSelected: false, text: AppStrings.Full_time, ),
              PickJobTypeField(isSelected: false, text: AppStrings.Remote,),
              PickJobTypeField(isSelected: false, text: AppStrings.Contract, ),
              PickJobTypeField(isSelected: false, text: AppStrings.Part_Time,),
              PickJobTypeField(isSelected: false, text: AppStrings.Onsite,),
              PickJobTypeField(isSelected: false, text: AppStrings.Internship,),

            ]
        ),
        SizedBox(height:25.h,),
        MainButton(
          width:85.w ,
          height:6.h ,
          text:AppStrings.Show_result,
          fontsize:15.sp,
          fontWeight:FontWeight.w500,
          color:AppColors.primrycolor,
          textcolor:AppColors.textcolor,
          onTab: (){},
        )
      ],
    );
  }
}
