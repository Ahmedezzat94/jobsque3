import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () { Navigator.pop(context); }, icon:Icon(Icons.arrow_back,color:AppColors.blackcolor,),),
        Text(AppStrings.Job_Detail,style:TextStyle(fontSize:15.sp,color:AppColors.blackcolor,fontWeight:FontWeight.w500),),
        SvgPicture.asset(AppImages.achive_active)
      ],
    );
  }
}
