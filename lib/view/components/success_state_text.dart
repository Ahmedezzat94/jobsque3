import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../core/utilities/app_colors.dart';
import '../../core/utilities/app_strings.dart';
import '../widgets/custome_text.dart';

class SuccessStateText extends StatelessWidget {
  const SuccessStateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text:AppStrings.youraccounthassetup,
            fontSize:20.sp,
            fontWeight:FontWeight.w700,
          ),
          SizedBox(height:2.h,),
          Container(
            //width:75.w,
            child: Column(
              children: [
                CustomText(
                  text: AppStrings.wehavecustomized,
                  fontSize:12.sp,
                  color:AppColors.nutralcolor,
                ),
                CustomText(
                    text: AppStrings.preferences,
                  fontSize:12.sp,
                  color:AppColors.nutralcolor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
