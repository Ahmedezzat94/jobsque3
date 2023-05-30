import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/complete_profile_cubit/complete_profile_cubit.dart';
import '../../components/home_page_components/head_section.dart';
import '../../components/profile_page_components/complete_profile_step_state.dart';
import '../../components/profile_page_components/general_pages.dart';
import '../../components/profile_page_components/others_pages.dart';
import '../../components/profile_page_components/profile_and_job_name.dart';
import '../../components/profile_page_components/profile_header.dart';
import '../../components/profile_page_components/profile_info_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit,CompleteProfileState>(
      builder: (BuildContext context, state) =>
          SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            SizedBox(height:9.h,),
            ProfileAndJobName(),
            SizedBox(height:3.h,),
            ProfileInfoField(),
            SizedBox(height:3.h,),
            //about.
            Padding(
              padding:EdgeInsets.only(left:5.w,right:2.w),
              child: HeadSection(
                LeftText:AppStrings.About,
                LeftTextcolor:AppColors.nutralcolor,
                RightText:AppStrings.Edit,
                onTap: (){},
              ),
            ),
            //the about content
            Container(
              margin:EdgeInsets.only(left:5.w,right:5.w),
                child: Text(
                    "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of."
                ,)
            ),
            SizedBox(height:2.h,),
            (CompleteProfileCubit.get(context).currentStep*25==100)
                ?SizedBox()
                :CompleteProfileStepState(),

             SizedBox(height:2.h,),
            //Head section(General)
            Container(
              height:5.h,
              padding:EdgeInsets.only(left:5.w),
              decoration:BoxDecoration(
                color:AppColors.nutral400.withOpacity(.2),
                border:Border.all(color:AppColors.nutralcolor.withOpacity(.2))
              ),
              child: HeadSection(
                LeftText:AppStrings.General,
                LeftTextcolor:AppColors.nutralcolor,
                RightText: "",
              ),
            ),
            GeneralPages(),
            //Head section(others)
            Container(
              height:5.h,
              padding:EdgeInsets.only(left:5.w),
              decoration:BoxDecoration(
                  color:AppColors.nutral400.withOpacity(.2),
                  border:Border.all(color:AppColors.nutralcolor.withOpacity(.2))
              ),
              child: HeadSection(
                LeftText:AppStrings.Others,
                LeftTextcolor:AppColors.nutralcolor,
                RightText: "",
              ),
            ),
            OthersPages()
          ],
        ),
      ), listener: (BuildContext context, Object? state) {  },
    );
  }
}
