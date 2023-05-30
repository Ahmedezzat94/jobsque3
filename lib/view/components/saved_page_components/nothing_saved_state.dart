import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';

class NothingSavedState extends StatelessWidget {
  const NothingSavedState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          children: [
            SizedBox(height:30.h,),
            SvgPicture.asset(AppImages.Saved_logo),
            CustomText(
                text: AppStrings.Nothing_has_been_saved_yet,
              fontSize: 18.sp,
              fontWeight:FontWeight.w600,
            ),
            SizedBox(height:2.h,),
            CustomText(
              text: AppStrings.Press_the_star_icon_on_the_job,
              fontSize:12.sp,
              color:AppColors.nutralcolor,
            )
          ],
        ),
      );

  }
}
