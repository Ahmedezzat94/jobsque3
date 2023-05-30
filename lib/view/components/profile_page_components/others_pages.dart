import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_strings.dart';
import '../../pages/profile_pages/others/accesibility_page.dart';
import '../../pages/profile_pages/others/help_center_page.dart';
import '../../pages/profile_pages/others/privacy_policy_page.dart';
import '../../pages/profile_pages/others/terms_and_conditions.dart';

class OthersPages extends StatelessWidget {
  OthersPages({Key? key}) : super(key: key);

  List pagesName = [
    AppStrings.Accesibility,
    AppStrings.Help_Center,
    AppStrings.Terms_Conditions,
    AppStrings.Privacy_Policy,
  ];

  List pages = [
    AccesibilityPage(),
    HelpCenterPage(),
    TermsAndConditions(),
    PrivacyPolicy()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:3.w,right:4.w),
      child: ListView.separated(
        padding:EdgeInsets.only(top:3.h,bottom:3.h,left:2.w,right: 2.w),
        //physics:NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        physics:NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (context,index) => Divider(),
        itemBuilder: (context,index) => Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
               Text(pagesName.elementAt(index),
               style:TextStyle(fontSize:14.sp),)
              ],
            ),

            IconButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>pages.elementAt(index)
                  )
              );
            },
                icon:Icon(Icons.arrow_forward,size:5.w,)
            )
          ],
        ),
      ),
    );

  }
}
