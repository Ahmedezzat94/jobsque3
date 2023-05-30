import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';


class TextIntroPage3 extends StatelessWidget {
  const TextIntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          RichText(
            maxLines:3,
            text:TextSpan(
                text:AppStrings.Get_the_best_choice,
                style:TextStyle(
                    fontWeight:FontWeight.w500,
                    fontSize:30,
                    color:AppColors.blackcolor
                ),
                children:[

                  TextSpan(
                      text:" ${AppStrings.choice_for_jop}",
                      style:TextStyle(
                          fontWeight:FontWeight.w500,
                          fontSize:30,
                          color:AppColors.primrycolor
                      )
                  ),
                  TextSpan(
                      text:" ${AppStrings.you_have_always_dreamed}",
                      style:TextStyle(
                          fontWeight:FontWeight.w500,
                          fontSize:30,
                          color:AppColors.blackcolor
                      )
                  )
                ]
            ),
          ),
          SizedBox(height:2.h,),
          CustomText(text:"${AppStrings.Immediately_join}",
            maxLines:2,
            color:AppColors.spikcolor,
            fontSize:17,
          ),
        ],
      ),
    );
  }
}
