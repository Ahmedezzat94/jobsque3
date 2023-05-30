import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';

class SetUpAccHeadLine extends StatelessWidget {
  const SetUpAccHeadLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
              children: [
                SizedBox(
                  width:85.w,
                  child: CustomText(
                    text: AppStrings.whattybeofwork,
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
                  child: CustomText(text:AppStrings.telluswhat,
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
