import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../../../../widgets/custome_text.dart';
import '../../../../widgets/inputfield.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/number_inputfield.dart';
import 'two_step_verification3.dart';

class TwoStepVerification2 extends StatelessWidget {
  TwoStepVerification2({Key? key}) : super(key: key);
   var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor:AppColors.textcolor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),),
        title:Text(AppStrings.Two_step_verification,style:TextStyle(
          color:AppColors.blackcolor
        ),),
        elevation:0,
      ),
      body:Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right:50.w,bottom:1.h,top:2.h),
              child: CustomText(text: AppStrings.Add_phone_number,
              fontSize:13.sp,
                fontWeight:FontWeight.w600,
              ),
            ),
            Padding(
              padding:EdgeInsets.only(right:20.w,bottom:2.h),
              child: CustomText(text: AppStrings.We_will_send_a_verification,
                fontSize:10.sp,
                fontWeight:FontWeight.w400,
                color: AppColors.nutralcolor,
              ),
            ),
            NumberInputField(
                validation: (value){
                  if(value.isEmpty){
                    return "Enter Your PhoneNumber";
                  }
                }),
            Padding(
              padding: EdgeInsets.only(left:5.w,top:2.h,bottom:1.h),
              child: Row(
                children: [
                  Text(AppStrings.Enter_your_password,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight:FontWeight.w600
                  ),),
                ],
              ),
            ),
            InputField(
              preIcon: Icon(Icons.lock_outline),
                issecure: true,
                validation: (value){
                if(value.isEmpty){
                  return"enter your password";
                }
                }
            ),
            SizedBox(height:48.h,),
            MainButton(
              height:6.h,
              width:90.w,
              color:AppColors.primrycolor,
              textcolor:AppColors.textcolor,
              text:AppStrings.Send_Code,
              fontWeight:FontWeight.w600,
              onTab: (){
                if(formKey.currentState!.validate()){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> TwoStepVerification3()
                      )
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
