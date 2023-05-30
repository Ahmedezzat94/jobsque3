import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_headline.dart';
import '../../widgets/custome_texbutton.dart';
import '../../widgets/custome_text.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/main_button.dart';
import 'check_your_email_screen.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
ResetPasswordScreen({Key? key}) : super(key: key);

var email_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        leading:IconButton(onPressed: () {
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,)),
        actions: [
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 8.w),
            child: SvgPicture.asset(
              AppImages.logo,
              height: 3.h,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: AppColors.textcolor,
      ),
      body:Column(
        children: [
          SizedBox(height:3.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:5.w),
            child: HeadLine(
              text1:AppStrings.resetpassword,
              fontsize1:18.sp,
              fontWeight1:FontWeight.w500,
              colortext1:AppColors.blackcolor,
              text2:AppStrings.Entertheemailadd,
              fontsize2:12.sp,
              colortext2: AppColors.nutralcolor,
              maxline2: 3,
            ),
          ),
          SizedBox(height:5.h,),
          InputField(
            controller: email_controller,
            keyboard: TextInputType.emailAddress,
            hint: AppStrings.email,
            preIcon:Icon(Icons.email_outlined),
            validation: (String v) {
              if (v.isEmpty) {
                return "please enter your email";
              }
            },
          ),
          SizedBox(height:45.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: AppStrings.yourememberyourpassword,
                color: AppColors.spikcolor,
              ),
              CustomTextButton(
                text: AppStrings.login,
                color: AppColors.primrycolor,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:(context)=>LogingScreen())
                  );
                },
              )
            ],
          ),
          MainButton(
            text: AppStrings.requestpasswordreset,
            textcolor: AppColors.textcolor,
            color: AppColors.primrycolor,
            height: 6.h,
            width: 90.w,
            onTab: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=>CheckYourEmailScreen())
              );
            },
          ),

        ],
      ),
    );
  }
}
