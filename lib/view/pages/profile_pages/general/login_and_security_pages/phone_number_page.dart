import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../../../../components/home_page_components/head_section.dart';
import '../../../../widgets/flutter_toggel_switch.dart';
import '../../../../widgets/main_button.dart';
import '../../../../widgets/number_inputfield.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

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
        title:Text(AppStrings.Phone_number,style:TextStyle(
            color:AppColors.blackcolor
        ),),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(left:5.w),
            child: HeadSection(
              LeftText:AppStrings.Main_phone_number,
              RightText: "",
              LeftTextcolor:AppColors.blackcolor,
              fontWeight_lefttext:FontWeight.w100,
            ),
          ),
          NumberInputField(validation: (){}),
          Padding(
            padding: EdgeInsets.only(left:5.w,right:5.w,top:2.h),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width:70.w,
                  child: Text(AppStrings.Use_the_phone_number,
                    maxLines:2,
                    style:TextStyle(
                    color:AppColors.nutral400,
                      fontSize:12.sp
                    ),
                   ),
                ),
                FlutterSwitch(isSelected: false,)
              ],
            ),
          ),
          SizedBox(height:58.h,),
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
