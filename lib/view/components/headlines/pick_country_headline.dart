import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';

class PickCountryHeadLine extends StatelessWidget {
  const PickCountryHeadLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width:85.w,
              child: CustomText(
                text: AppStrings.whereareyourlocations,
                fontSize:25,
                fontWeight:FontWeight.w700,
                maxLines:2,
              ),
            )
          ],
        ),

        SizedBox(height:2.h,),
        Row(
          children: [
            SizedBox(
              width:85.w,
              child: CustomText(text:AppStrings.letusknow,
                color:AppColors.nutralcolor,
                fontSize:15,
                maxLines:2,
              ),
            ),
          ],
        ),

      ],
    );

  }
}
