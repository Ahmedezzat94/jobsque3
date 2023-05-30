import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../pages/comlete_profile_pages/education_page.dart';
import '../../pages/comlete_profile_pages/experience_page.dart';
import '../../pages/profile_pages/general/edit_profile.dart';
import '../../pages/profile_pages/general/language.dart';
import '../../pages/profile_pages/general/login_and_security.dart';
import '../../pages/profile_pages/general/notification.dart';
import '../../pages/profile_pages/general/portofolio.dart';

class GeneralPages extends StatelessWidget {
  GeneralPages({Key? key}) : super(key: key);
  
 List Item= [
   SvgPicture.asset(AppImages.edit_profile),
   Container(
     alignment:Alignment.center,
     height:9.w ,
     width:9.w,
     decoration:BoxDecoration(
       color:AppColors.primrycolor.withOpacity(0.2),
       borderRadius:BorderRadius.all(Radius.circular(50))
     ),
       child: SvgPicture.asset(AppImages.education_icon,color:AppColors.primrycolor,)),
   Container(
       alignment:Alignment.center,
       height:9.w ,
       width:9.w,
       decoration:BoxDecoration(
           color:AppColors.primrycolor.withOpacity(0.2),
           borderRadius:BorderRadius.all(Radius.circular(50))
       ),
       child: Image.asset(AppImages.experience,color:AppColors.primrycolor,)),
   SvgPicture.asset(AppImages.portofolio),
   SvgPicture.asset(AppImages.language),
   SvgPicture.asset(AppImages.notifications),
   SvgPicture.asset(AppImages.login_and_security)
 ];
 
 List screenName = [
   AppStrings.Edit_Profile,
   AppStrings.education,
   AppStrings.expreience,
   AppStrings.Portfolio,
   AppStrings.Langauge,
   AppStrings.Notification,
   AppStrings.Login_and_security,
 ];

 List pages =[
   EditProfile(),
   EducationPage(),
   ExperiencePage(),
   Portofolio(),
   Language(),
   NotificationPage(),
   LoginAndSecurity()
 ];
 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left:3.w,right:4.w),
        child: ListView.separated(
          padding:EdgeInsets.only(top:3.h,bottom:3.h,left:2.w,right: 2.w),
          physics:NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pages.length,
          separatorBuilder: (context,index) => Divider(),
            itemBuilder: (context,index) => Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                 Row(
                    children: [
                      Item.elementAt(index),
                      SizedBox(width:2.w,),
                     Text(screenName.elementAt(index),
                       style:TextStyle(
                         fontSize:13.sp
                       ),
                     )
                    ],
                  ),

                IconButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>pages.elementAt(index))
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
