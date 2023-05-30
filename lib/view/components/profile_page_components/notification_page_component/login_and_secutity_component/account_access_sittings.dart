import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../../../../pages/profile_pages/general/login_and_security_pages/change_password_page.dart';
import '../../../../pages/profile_pages/general/login_and_security_pages/email_adrees_page.dart';
import '../../../../pages/profile_pages/general/login_and_security_pages/face_id_page.dart';
import '../../../../pages/profile_pages/general/login_and_security_pages/phone_number_page.dart';
import '../../../../pages/profile_pages/general/login_and_security_pages/two_step_vrification_page.dart';



class AccountAccessSittings extends StatelessWidget {
  AccountAccessSittings({Key? key}) : super(key: key);

  List sittingsName = [
    AppStrings.Email_address,
    AppStrings.Phone_number,
    AppStrings.Change_password,
    AppStrings.Two_step_verification,
    AppStrings.Face_ID,
  ];

  List accountPages = [
    const EmailAdressPage(),
    const PhoneNumberPage(),
    const ChangePassPage(),
    const TwoStepVerificatiion(),
    const FaceIdPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:3.w,right:4.w),
      child: ListView.separated(
        padding:EdgeInsets.only(top:3.h,bottom:3.h,left:2.w,right: 2.w),
        //physics:NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        separatorBuilder: (context,index) => const Divider(),
        itemBuilder: (context,index) => Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:EdgeInsets.only(top:1.h,bottom:3.h),
              child: Row(
                children: [
                  Text(sittingsName.elementAt(index),
                    style:TextStyle(
                        fontSize:13.sp
                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=>accountPages.elementAt(index)
                  )
              );
            },
                icon: Icon(Icons.arrow_forward,color:AppColors.blackcolor,size:5.w,))

          ],
        ),
      ),
    );

  }
}
