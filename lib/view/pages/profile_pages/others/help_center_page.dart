import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../components/home_page_components/search_bar.dart';
import '../../../components/profile_page_components/help_center_component/fieldinfoCard.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor:AppColors.textcolor,
        leading:IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back,color: AppColors.blackcolor,),),
        title:Text(AppStrings.Help_Center,style:TextStyle(
            color:AppColors.blackcolor
        ),),
        elevation:0,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(left:5.w,right:5.w),
              child: SearchBar(),
            ),
            SizedBox(height:2.h,),
            FieldInfoCard(),
            SizedBox(height:2.h,),
            FieldInfoCard(),
            SizedBox(height:2.h,),
            FieldInfoCard(),
            SizedBox(height:2.h,),
            FieldInfoCard(),
            SizedBox(height:2.h,),
            FieldInfoCard(),

          ],
        ),
      )
    );
  }
}
