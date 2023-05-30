import 'package:flutter/cupertino.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';

class RegisterHeadLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:25),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                  text: AppStrings.creatacount,
                fontSize:25,
                fontWeight:FontWeight.w600,
              )
            ],
          ),
          SizedBox(height:1.h,),
          Row(
            children: [
              CustomText(text:AppStrings.pleasecreateanaccount,
                color:AppColors.spikcolor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
