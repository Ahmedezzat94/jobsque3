import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_assets.dart';
import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';

class TwoStepInfoCard extends StatelessWidget {
  const TwoStepInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(AppImages.IconLock),
            Container(
              width:70.w,
              child:Text(AppStrings.Two_step_verification_provides,
                maxLines:3,
                style:TextStyle(
                color:AppColors.nutralcolor,
              ),),
            )
          ],
        ),
        SizedBox(height: 2.h,),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(AppImages.IconLock2),
            Container(
              width:70.w,
              child:Text(AppStrings.Adding_a_phone_number_or,
                maxLines:3,
                style:TextStyle(
                  color:AppColors.nutralcolor,
                ),),
            )
          ],
        ),
      ],
    );
  }
}
