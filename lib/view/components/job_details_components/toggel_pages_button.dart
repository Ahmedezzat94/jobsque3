import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/job_details_cubit/job_details_cubit.dart';

class ToggelPagesButton extends StatelessWidget {
  ToggelPagesButton({Key? key}) : super(key: key);

  List<String> labels = [
    AppStrings.Desicription,
    AppStrings.Company,
    AppStrings.People,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailsCubit,JobDetailsState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
           FlutterToggleTab(
             width:22.w,
            labels: labels,
            selectedLabelIndex: (index ) {
              JobDetailsCubit.get(context).onButtonTap(index);
            },
            selectedTextStyle: TextStyle(fontSize:10.sp,color:AppColors.textcolor),
            unSelectedTextStyle: TextStyle(fontSize:10.sp,color:AppColors.nutralcolor),
            selectedIndex:JobDetailsCubit.get(context).textButtonTap,
            selectedBackgroundColors: [AppColors.secondrycolor],
            unSelectedBackgroundColors: [AppColors.nutral201],
          )
        );
  }
}
