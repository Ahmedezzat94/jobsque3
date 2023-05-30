import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/utilities/app_assets.dart';
import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../../../../components/home_page_components/head_section.dart';
import '../../../../widgets/inputfield.dart';
import '../../../../widgets/main_button.dart';

class EmailAdressPage extends StatelessWidget {
  const EmailAdressPage({Key? key}) : super(key: key);

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
          icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),),
        title:Text(AppStrings.Email_address,style:TextStyle(
            color:AppColors.blackcolor
        ),),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(left:5.w),
            child: HeadSection(
              LeftText:AppStrings.Main_email_address,
              RightText: "",
              LeftTextcolor:AppColors.blackcolor,
              fontWeight_lefttext:FontWeight.w100,
            ),
          ),
          InputField(
            preIcon:Image.asset(AppImages.sms_icon,),
              validation: (){}
          ),
          SizedBox(height:65.h,),
          MainButton(
            height:6.h,
            width: 90.w,
            color:AppColors.primrycolor,
            textcolor:AppColors.textcolor,
            text:AppStrings.Save,
            fontWeight:FontWeight.w500,
            onTab: (){},
          )
        ],
      ),
    );
  }
}
