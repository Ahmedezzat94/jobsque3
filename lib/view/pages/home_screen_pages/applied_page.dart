import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/home_screen_cubit/main_layout_cubit.dart';
import '../../components/applied_page_components/no_application_rejected.dart';
import '../../components/applied_page_components/toggel_applied_button.dart';

class AppliedPage extends StatelessWidget {
  const AppliedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor:AppColors.textcolor,
          leading:IconButton(icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),
              onPressed: () {
                MainLayOutCubit.get(context).OnBackArrowTap();
              }
          ),
          title:Text("${AppStrings.Applied} Jop",style:TextStyle(color:AppColors.blackcolor),),
          elevation: 0,
        ),
        SizedBox(height:2.h,),
        ToggleAppliedButton(),
        NoApplicationRejected()
        // Center(
        //   child:Text("Applied Page",style:TextStyle(fontSize:40),),
        // ),
      ],
    );
  }
}
