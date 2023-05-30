import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../../../../components/home_page_components/head_section.dart';
import '../../../../screens/home_screens/home_screen.dart';
import '../../../../screens/splash_screen.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/pin_code.dart';

class TwoStepVerification3 extends StatelessWidget {
   TwoStepVerification3({Key? key}) : super(key: key);
   TextEditingController pinController = TextEditingController();
 var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor:AppColors.textcolor,
        leading: IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),
        ),
        title:Text(AppStrings.Two_step_verification,style:TextStyle(
          color:AppColors.blackcolor
        ),),
        elevation: 0,
      ),
      body:Column(
        children: [
                Padding(
                  padding:EdgeInsets.only(left:5.w,top:3.h),
                  child: Row(
                    children: [
                      Text(AppStrings.Enter_the_6_digit_code,style:TextStyle(
                        fontSize:13.sp,
                        fontWeight:FontWeight.w600,
                      ),)
                    ],
                  ),
                ),
                SizedBox(height:2.h,),
                Padding(
                  padding:EdgeInsets.only(left:5.w),
                  child: Row(
                    children: [
                      Container(
                        width:90.w,
                        child: Text(AppStrings.Please_confirm_your,
                          maxLines: 2,
                          style:TextStyle(
                          fontSize:10.sp,
                          color:AppColors.nutralcolor
                        ),),
                      )
                    ],
                  ),
                ),
          SizedBox(height:2.h,),
          Padding(
            padding:EdgeInsets.only(left:5.w,right:5.w),
            child: Form(
                child:PinCode(
                    forceErrorState: false,
                  pinController:pinController,
                  onCompleted: (pin)=>
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder:
                              (context)=>HomeScreen())),
                  onSubmitted: (text){
                      print("submited");
                  },
                  validator: (pin){
                      if(pin!.isEmpty){
                        pinController.text;
                        return "please enter the code";
                      }
                  },
                )),
          ),
          Padding(
            padding:EdgeInsets.only(left:5.w),
            child: HeadSection(LeftText:AppStrings.Resend_code_42s,
            RightText: "",),
          ),
          SizedBox(height:53.h,),
          MainButton(
            height:6.h,
            width:90.w,
            color:AppColors.primrycolor,
            textcolor: AppColors.textcolor,
            text:AppStrings.Verify,
            fontsize:12.sp,
            fontWeight:FontWeight.w500,
            onTab: (){
              if(formKey.currentState!.validate()){
                pinController.text;
                Navigator.pushReplacement
                  (context, MaterialPageRoute(builder: (context)=>
                SplashScreen()
                )
                );
              }
            },
          )
        ],
      ),
    );
  }
}
