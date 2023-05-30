import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../screens/home_screens/home_screen.dart';
import '../../widgets/custome_text.dart';
import '../../widgets/main_button.dart';

class JopAppliedState extends StatelessWidget {
  const JopAppliedState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textcolor,
      appBar:AppBar(
        backgroundColor: AppColors.textcolor,
        leading:IconButton(
          onPressed: () {
            Navigator.pop(context);
    },
          icon:Icon(Icons.arrow_back_outlined,color:AppColors.blackcolor,),
      ),
        elevation: 0,
    ),
      body: Column(
        children: [
          SizedBox(height:13.h,),
          Center(
              child:SvgPicture.asset(AppImages.applied_success_logo)),
          SizedBox(height:3.h,),
          Container(
            width:70.w,
            child: CustomText(
              text:AppStrings.Your_data_has_been_successfully_sent,
              fontSize:18.sp,
              fontWeight:FontWeight.w600,
              textAlign:TextAlign.center,
              maxLines:2,
            ),
          ),
          SizedBox(height:2.h,),
          Container(
            width:90.w,
            child: CustomText(
              text:AppStrings.You_will_get_a_message_from,
              fontSize:14.sp,

              color:AppColors.nutralcolor,
              textAlign:TextAlign.center,
              maxLines:2,
            ),
          ),
          SizedBox(height:30.h,),
          MainButton(
            height:6.h,
            width:90.w,
            text:AppStrings.Back_to_home,
            textcolor:AppColors.textcolor,
            fontWeight:FontWeight.w500,
            color:AppColors.primrycolor,
            onTab:(){
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
            },
          )
        ],
      ),
    );
  }
}
