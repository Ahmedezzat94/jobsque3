import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';

class NoApplicationRejected extends StatelessWidget {
  const NoApplicationRejected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            SizedBox(height:15.h,),
            Center(
                child: SvgPicture.asset(AppImages.noapprejected)),
            SizedBox(height:2.h,),
            Container(
              child:CustomText(
                text: AppStrings.No_applications_were_rejected,
                fontSize:19.sp,
                fontWeight:FontWeight.w600,
              ),
            ),
            SizedBox(height:1.h,),
            Container(
              width:95.w,
              child:CustomText(
                text: AppStrings.If_there_is_an_application,
                color:AppColors.nutralcolor,
                fontSize:13.sp,
                maxLines:2,
                textAlign:TextAlign.center,
              ),
            )
          ],
        ),
      );

  }
}
