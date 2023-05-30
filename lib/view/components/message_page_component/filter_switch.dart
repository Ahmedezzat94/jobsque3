import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';

class FilterSwitch extends StatelessWidget {
  Function()? ontap;
  FilterSwitch({
    Key? key,
    this.ontap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child: Container(
        padding:EdgeInsets.all(3.w),
        decoration:BoxDecoration(
          border:Border.all(color:AppColors.nutral400,),
          borderRadius:BorderRadius.circular(100)
        ),
        child:SvgPicture.asset(AppImages.filter_icon),
      ),
    );
  }
}
