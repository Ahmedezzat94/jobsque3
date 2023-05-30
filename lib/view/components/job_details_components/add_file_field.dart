import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/job_details_cubit/job_details_cubit.dart';

class AddFileField extends StatelessWidget {
  const AddFileField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:26.h,
      width:88.w,
      decoration:BoxDecoration(
          color:AppColors.primari100.withOpacity(0.5),
          border:Border.all(color:AppColors.primrycolor),
          borderRadius: BorderRadius.circular(10)
      ),
      child:Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AppImages.document_upload_icon),
          Text(AppStrings.Upload_your_other_file,
            style:TextStyle(fontSize:16.sp,fontWeight:FontWeight.w500),),
          Text(AppStrings.Max_file_size_10_MB,
            style:TextStyle(color:AppColors.nutralcolor),),
          InkWell(
            onTap:(){
              JobDetailsCubit.get(context).pickFile();
            },
            child: Container(
              padding:EdgeInsets.only(left:25.w),
              height:5.h,
              width:80.w,
              decoration:BoxDecoration(
                  color:AppColors.primari100,
                  border:Border.all(color:AppColors.primrycolor),
                  borderRadius:BorderRadius.circular(20)
              ),
              child:Row(
                children: [
                  SvgPicture.asset(AppImages.export_icon),
                  SizedBox(width:3.w,),
                  Text(AppStrings.Add_file,style:TextStyle(
                      color:AppColors.primrycolor,fontWeight:FontWeight.w500,
                    fontSize:13.sp
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
