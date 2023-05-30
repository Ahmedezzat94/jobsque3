import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';


class TextIntroPage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          RichText(
            maxLines:3,
            text:TextSpan(
                text:AppStrings.findajob,
                style:TextStyle(
                    fontWeight:FontWeight.w500,
                    fontSize:30,
                    color:AppColors.blackcolor
                ),
                children:[
                  TextSpan(
                      text:" ${AppStrings.starbuilding}",
                      style:TextStyle(
                          fontSize:30,
                          fontWeight:FontWeight.w500,
                          color:AppColors.primrycolor
                      )
                  ),
                  TextSpan(
                      text:" ${AppStrings.yourcareer}",
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
          CustomText(text:"${AppStrings.Explore_over}",
            maxLines:2,
            color:AppColors.spikcolor,
            fontSize:17,
          ),
        ],
      ),
    );
  }
}