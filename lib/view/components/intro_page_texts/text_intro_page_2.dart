import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';


class TextIntroPage2 extends StatelessWidget {
  const TextIntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          RichText(
            maxLines:3,
            text:TextSpan(
                text:AppStrings.Hundreds_of,
                style:TextStyle(
                    fontWeight:FontWeight.w500,
                    fontSize:30,
                    color:AppColors.blackcolor
                ),
                children:[

                  TextSpan(
                      text:" ${AppStrings.join_together}",
                      style:TextStyle(
                          fontWeight:FontWeight.w500,
                          fontSize:30,
                          color:AppColors.primrycolor
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
