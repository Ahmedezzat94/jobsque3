import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../core/utilities/app_assets.dart';
import '../../core/utilities/app_colors.dart';
import '../../core/utilities/app_strings.dart';
import '../../domin/entities/recent_job/recent_job_entity.dart';
import 'home_page_components/head_section.dart';

class SuggestionSection extends StatelessWidget {
  List<RecentJob> jobs;
  SuggestionSection({Key? key, required this.isRecent,required this.jobs}) : super(key: key);
  bool isRecent = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        Container(
            padding: EdgeInsets.only(left: 5.w),
            height: 5.h,
            decoration: BoxDecoration(
                color: AppColors.nutral200,
                border: Border.all(color: AppColors.nutral201)),
            child: (isRecent)
                ? HeadSection(
                    LeftText: AppStrings.Recent_searches,
                    LeftTextcolor: AppColors.nutralcolor,
                    RightText: "",
                  )
                : HeadSection(
                    LeftText: AppStrings.Popular_searches,
                    LeftTextcolor: AppColors.nutralcolor,
                    RightText: "",
                  )),
        Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
          child: ListView.separated(
            itemCount: jobs.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    (isRecent)
                        ? SvgPicture.asset(AppImages.clock_icon)
                        : SvgPicture.asset(AppImages.search_status),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text("${jobs[index].name}"),
                  ],
                ),
                (isRecent)
                    ? SvgPicture.asset(AppImages.close_circle)
                    : SvgPicture.asset(AppImages.arrow_right)
              ],
            ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 2.h,
              );
            },
          ),
        ),
      ],
    );
  }
}
// ListTile(
// title: Text("Ui/designer"),
// trailing: (isRecent)
// ? SvgPicture.asset(AppImages.close_circle)
// : SvgPicture.asset(AppImages.arrow_right),
// leading: (isRecent)
// ? SvgPicture.asset(AppImages.clock_icon)
// : SvgPicture.asset(
// AppImages.search_status,
// ),
// )
