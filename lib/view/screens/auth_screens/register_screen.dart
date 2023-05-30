import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/auth/register/register_cubit.dart';
import '../../components/headlines/register_page_headline.dart';
import '../../components/register_or_line.dart';
import '../../widgets/custome_texbutton.dart';
import '../../widgets/custome_text.dart';
import '../../widgets/facebook_auth_button.dart';
import '../../widgets/google_auth_button.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/main_button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      builder: (BuildContext context, state) => Scaffold(
        backgroundColor: AppColors.textcolor,
        appBar: AppBar(
          backgroundColor: AppColors.textcolor,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SvgPicture.asset(
                AppImages.logo,
                height: 3.h,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: RegisterCubit.get(context).formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                RegisterHeadLine(),
                SizedBox(
                  height: 4.h,
                ),
                InputField(
                  controller: RegisterCubit.get(context).username_contrller,
                  keyboard: TextInputType.text,
                  hint: AppStrings.username,
                  preIcon:Icon(Icons.person_outline),
                  validation: (String value) {
                    if (value.isEmpty) {
                      return "please enter your name";
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                InputField(
                  controller:RegisterCubit.get(context).email_contrller,
                  keyboard: TextInputType.emailAddress,
                  hint: AppStrings.email,
                  preIcon:Icon(Icons.email_outlined),
                  validation: (String v) {
                    if (v.isEmpty) {
                      return "please enter your email";
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                InputField(
                  controller: RegisterCubit.get(context).password_contrller,
                  keyboard: TextInputType.number,
                  hint: AppStrings.password,
                  preIcon:Icon(Icons.lock_outline),
                  issecure: true,
                  validation: (String v) {
                    if (v.isEmpty) {
                      return "please enter your password";
                    }
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppStrings.Alreadyhaveanaccount,
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
                SizedBox(
                  height: 1.h,
                ),
                MainButton(
                  isLoading: (state is RegisterLoading)
                  ?true
                  :false,
                  text: AppStrings.creatacount,
                  fontWeight: FontWeight.w400,
                  fontsize: 12.sp,
                  textcolor: (state is RegisterInitial)
                  ?AppColors.nutralcolor
                      :AppColors.textcolor,
                  color: (state is RegisterInitial)
                      ?AppColors.backgroundcolor
                  :AppColors.primrycolor,
                  height: 6.h,
                  width: 90.w,
                  onTab: () {
                   RegisterCubit.get(context).onRegistrationTap(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: RegisterOrline(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GoogleAuthButton(
                      text: AppStrings.google,
                      color: AppColors.textcolor,
                      height: 5.h,
                      width: 40.w,
                      onTab: (){},
                    ),
                    FacebookAuthButton(
                      text: AppStrings.facebook,
                      color: AppColors.textcolor,
                      height: 5.h,
                      width: 40.w,
                      onTab: (){},
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ), listener: (BuildContext context, Object? state) {  },
    );
  }
}
