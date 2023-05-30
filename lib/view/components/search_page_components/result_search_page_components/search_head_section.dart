import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../home_page_components/head_section.dart';

class SearchHeadSection extends StatelessWidget {
  const SearchHeadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:EdgeInsets.only(left:5.w),
        height:5.h,
        decoration:BoxDecoration(
            color:AppColors.nutral200,
            border:Border.all(color:AppColors.nutral201)
        ),
        child:HeadSection(
          LeftText:AppStrings.Featuring_120_jobs,
          LeftTextcolor:AppColors.nutralcolor,
          RightText: "",)
    );
  }
}
