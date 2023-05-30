import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../core/utilities/app_colors.dart';
import '../../core/utilities/app_strings.dart';
import '../widgets/custome_text.dart';

class EmailStateText extends StatelessWidget {
  const EmailStateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text:AppStrings.checkyouremail,
            fontSize:20.sp,
            fontWeight:FontWeight.w700,
          ),
          SizedBox(height:2.h,),
          Container(
            //width:75.w,
            child: Column(
              children: [
                CustomText(
                  text: AppStrings.wehavesentaresetpass,
                  fontSize:14.sp,
                  color:AppColors.nutralcolor,
                  textAlign:TextAlign.center,
                  maxLines:2,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
