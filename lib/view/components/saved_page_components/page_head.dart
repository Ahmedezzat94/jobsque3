import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';

class PageHead extends StatelessWidget {
  const PageHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.center,
      height:5.h,
      width: double.infinity,
      decoration:BoxDecoration(
          color: AppColors.spikcolor.withOpacity(0.2),
          border:Border.all(color:AppColors.nutral200)
      ),
      child: Text(AppStrings.twelve_job_saved
        ,style:TextStyle(color:AppColors.nutralcolor,fontWeight:FontWeight.w400),),
    );
  }
}
