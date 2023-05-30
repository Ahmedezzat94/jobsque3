import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../components/home_page_components/head_section.dart';
import '../../../components/profile_page_components/notification_page_component/login_and_secutity_component/account_access_sittings.dart';

class LoginAndSecurity extends StatelessWidget {
   LoginAndSecurity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor:AppColors.textcolor,
        leading:IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),
        ),
        title:Text(AppStrings.Login_and_security,style:TextStyle(
          color:AppColors.blackcolor
        ),),
        elevation:0,
      ),
      body: Column(
        children: [
          SizedBox(height:2.h,),
          //Account access Head.
          Container(
            height:5.h,
            padding:EdgeInsets.only(left:5.w),
            decoration:BoxDecoration(
              border:Border.all(color:AppColors.nutral300),
              color:AppColors.nutralcolor.withOpacity(0.2)
            ),
            child:HeadSection(
              LeftText:AppStrings.Accont_access,
              RightText: "",
              LeftTextcolor:AppColors.nutralcolor,
            ),
          ),
          AccountAccessSittings()
        ],
      )
    );
  }
}
