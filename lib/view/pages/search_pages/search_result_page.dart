import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../blocs/home_search_cubit/home_search_cubit.dart';
import '../../components/message_page_component/filter_switch.dart';
import '../../components/search_page_components/result_search_page_components/jobs_bar.dart';
import '../../components/search_page_components/result_search_page_components/recent_search_jobs.dart';
import '../../components/search_page_components/result_search_page_components/search_head_section.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSearchCubit, HomeSearchState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h, left: 4.w),
            child: Row(
              children: [
                FilterSwitch(),
                SizedBox(
                  width: 2.w,
                ),
                JobsBar()
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SearchHeadSection(),
          SizedBox(
            height: 2.h,
          ),
          RecentSearchJobs()
        ],
      ),
    );
  }
}
// SvgPicture.asset(AppImages.filter_icon),

// TabButton(
// padding:EdgeInsets.only(left:4.w),
// height:4.h,
// width: 25.w,
// color:AppColors.secondrycolor,
// child:Row(
// children: [
// Text(AppStrings.Remote,style:TextStyle(color:AppColors.textcolor,fontSize:10.sp),),
// Icon(Icons.keyboard_arrow_down,color:AppColors.nutral300,)
// ],
// ),
// )
