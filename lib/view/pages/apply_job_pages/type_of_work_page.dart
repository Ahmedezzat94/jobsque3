import 'package:flutter/cupertino.dart';

import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../components/job_details_components/type_of_work_fields.dart';


class TypeOfWorkPage extends StatelessWidget {
  const TypeOfWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:EdgeInsets.only(right:60.0.w,top:2.h,bottom: 1.h),
          child: Text(AppStrings.Type_of_work,
            style:TextStyle(fontWeight:FontWeight.w600,fontSize:14.sp),),

        ),
        Padding(
          padding:EdgeInsets.only(right:42.w,bottom:2.h),
          child:Text(AppStrings.Fill_in_your_bio_data_correctly,
            style:TextStyle(color:AppColors.nutralcolor),),
        ),
        SizedBox(height:2.h,),
        TypeOfWorkFields()
      ],
    );
 }
}
