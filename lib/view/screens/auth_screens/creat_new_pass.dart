import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_headline.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/main_button.dart';
import 'changepass_state_logo.dart';

class CreatNewPassScreen extends StatelessWidget {
   CreatNewPassScreen({Key? key}) : super(key: key);

   var password_controller1 = TextEditingController();
   var password_controller2 = TextEditingController();
   var formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height:3.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:6.w),
                child: HeadLine(
                  text1:AppStrings.createnewpasswors,
                  fontsize1:20.sp,
                  fontWeight1:FontWeight.w600,
                  text2:AppStrings.setyournewpasswordsoyoucanlogin,
                  fontsize2:12.sp,
                  colortext2:AppColors.nutralcolor,
                ),
              ),
              SizedBox(height:5.h,),
              InputField(
                controller: password_controller1,
                keyboard: TextInputType.number,
                hint: AppStrings.password,
                preIcon:Icon(Icons.lock_outline),
                issecure: true,
                validation: (String v) {
                  if (v.isEmpty) {
                    return AppStrings.passwordmustbe8characters;
                  }
                },
              ),
              SizedBox(height:7.h,),
              InputField(
                controller: password_controller2,
                keyboard: TextInputType.number,
                hint: AppStrings.password,
                preIcon:Icon(Icons.lock_outline),
                issecure: true,
                validation: (String v) {
                  if (v.isEmpty) {
                    return AppStrings.passwordmustbe8characters;
                  }
                },
              ),
              SizedBox(height:38.h,),
              MainButton(
                text: AppStrings.resetpassword,
                textcolor: AppColors.textcolor,
                color: AppColors.primrycolor,
                height: 6.h,
                width: 90.w,
                onTab: () {
                  if (formKey.currentState!.validate()) {
                    password_controller1.text;
                    password_controller2.text;

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PassChangedScreen()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
