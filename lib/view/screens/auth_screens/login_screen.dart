import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/auth/login/login_cubit.dart';
import '../../components/checkbox_and_forgetpass.dart';
import '../../components/headlines/login_headline.dart';
import '../../components/login_or_line.dart';
import '../../widgets/custome_texbutton.dart';
import '../../widgets/custome_text.dart';
import '../../widgets/facebook_auth_button.dart';
import '../../widgets/google_auth_button.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/main_button.dart';
import 'register_screen.dart';

class LogingScreen extends StatelessWidget {
   LogingScreen({Key? key}) : super(key: key);


  TextEditingController username_contrller = TextEditingController();
  TextEditingController email_contrller = TextEditingController();
  TextEditingController password_contrller = TextEditingController();
   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (BuildContext context, Object? state) {

      },
      builder: (BuildContext context, state)=>
          Scaffold(
        backgroundColor: AppColors.textcolor,
        appBar:AppBar(
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
        body:SingleChildScrollView(
          child: Form(
            key:LoginCubit.get(context).formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                LoginHeadLine(),
                SizedBox(
                  height: 5.h,
                ),
                InputField(
                  controller: LoginCubit.get(context).username_contrller,
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
                  controller: LoginCubit.get(context).password_contrller,
                  keyboard: TextInputType.text,
                  hint: AppStrings.password,
                  preIcon:Icon(Icons.lock_outline),
                  issecure: true,
                  validation: (String v) {
                    if (v.isEmpty) {
                      return "please enter your password";
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CheckBoxAndForgetPass(),
                ),
                SizedBox(height:18.h,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: AppStrings.donthaveanaccount,
                      color:AppColors.spikcolor,
                    ),
                    CustomTextButton(
                      text:AppStrings.register,
                      onPressed:(){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>RegisterScreen()));
                      },
                      color:AppColors.primrycolor,
                    )
                  ],
                ),
                MainButton(
                  isLoading: (state is LoginLoading)
                      ?true
                      :false,
                  text: AppStrings.login,
                  fontWeight: FontWeight.w400,
                  fontsize: 12.sp,
                  textcolor: (state is LoginInitial)
                      ?AppColors.nutralcolor
                      :AppColors.textcolor,
                  color: (state is LoginInitial)
                      ?AppColors.backgroundcolor
                      :AppColors.primrycolor,
                  height: 6.h,
                  width: 90.w,
                  onTab: (){
                       LoginCubit.get(context).onLoginButtonTap(context);
                  },
                ),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: LoginOrline(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GoogleAuthButton(
                      text: AppStrings.google,
                      color: AppColors.textcolor,
                      height: 5.h,
                      width: 40.w,
                    ),
                    FacebookAuthButton(
                      text: AppStrings.facebook,
                      color: AppColors.textcolor,
                      height: 5.h,
                      width: 40.w,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
