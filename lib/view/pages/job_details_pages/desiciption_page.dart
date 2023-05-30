import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_strings.dart';
import '../../components/home_page_components/head_section.dart';

class DisicriptionPage extends StatelessWidget {
  String job_description;
  String job_skill;

DisicriptionPage({Key? key,required this.job_description,required this.job_skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          HeadSection(
            LeftText:AppStrings.Job_Description,
            fontsize_lefttext: 11.sp,
            RightText: "",
          ),
          Text(job_description),
          HeadSection(
            LeftText:AppStrings.Skill_Required,
            fontsize_lefttext: 11.sp,
            RightText: "",
          ),
          Text(job_skill)
        ]
    );
  }
}
