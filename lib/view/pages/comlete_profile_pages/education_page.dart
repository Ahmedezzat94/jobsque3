import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/complete_profile_cubit/complete_profile_cubit.dart';
import '../../components/home_page_components/head_section.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/main_button.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit,CompleteProfileState>(
      listener: (BuildContext context, Object? state) {

      },
      builder: (BuildContext context, state) => Scaffold(
        backgroundColor:AppColors.textcolor,
        appBar: AppBar(
          backgroundColor:AppColors.textcolor,
          leading:IconButton(
            onPressed: () {
              CompleteProfileCubit.get(context).onEducationValidate(context);
              Navigator.pop(context);
              },
            icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),

          ),
          title:Text(AppStrings.education,
          style:TextStyle(
            color:AppColors.blackcolor
          ),
          ),
          elevation: 0,
        ),
        body:Column(
          children: [
            Center(
              child: Container(
                height:60.h,
                width: 90.w,
                decoration:BoxDecoration(
                  //color:AppColors.nutral400,
                  borderRadius:BorderRadius.circular(12),
                  border:Border.all(color:AppColors.blackcolor.withOpacity(0.2))
                ),
                child:SingleChildScrollView(
                  child: Form(
                    key:CompleteProfileCubit.get(context).educationformKey,
                    child: Column(
                      children: [
                        Padding(
                          padding:EdgeInsets.only(left:5.w),
                          child: HeadSection(
                            LeftText:AppStrings.University,
                            LeftTextcolor:AppColors.nutralcolor,
                            RightText: "",
                          ),
                        ),
                        InputField(
                            controller:CompleteProfileCubit.get(context).universityController,
                            validation: (value){
                              if(value.isEmpty){
                                return "enter the university";
                              }
                            }
                        ),
                        Padding(
                          padding:EdgeInsets.only(left:5.w),
                          child: HeadSection(
                            LeftText:AppStrings.Title,
                            LeftTextcolor:AppColors.nutralcolor,
                            RightText: "",
                          ),
                        ),
                        InputField(
                            controller:CompleteProfileCubit.get(context).titleController,
                            validation: (value){
                              if(value.isEmpty){
                                return "enter your title";
                              }
                            }
                        ),
                        Padding(
                          padding:EdgeInsets.only(left:5.w),
                          child: HeadSection(
                            LeftText:AppStrings.Start_Year,
                            LeftTextcolor:AppColors.nutralcolor,
                            RightText: "",
                          ),
                        ),
                        InputField(
                            controller:CompleteProfileCubit.get(context).startyearController,
                            validation: (value){
                              if(value.isEmpty){
                                return "enter wich year you start";
                              }
                            }
                        ),
                        Padding(
                          padding:EdgeInsets.only(left:5.w),
                          child: HeadSection(
                            LeftText:AppStrings.End_Year,
                            LeftTextcolor:AppColors.nutralcolor,
                            RightText: "",
                          ),
                        ),
                        InputField(
                            controller:CompleteProfileCubit.get(context).endyearController,
                            validation: (value){
                              if(value.isEmpty){
                                return "enter wich year you ended the jop";
                              }
                            }
                        ),
                        SizedBox(height:4.h,),
                        MainButton(
                          height: 6.h,
                          width: 80.w,
                          color:AppColors.primrycolor,
                          text:AppStrings.Save,
                          textcolor:AppColors.textcolor,
                          fontWeight:FontWeight.w500,
                          onTab: (){
                            CompleteProfileCubit.get(context).onEducationValidate(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:3.h,),
            Container(
              alignment:Alignment.center,
              height:14.h,
              width: 90.w,
              decoration:BoxDecoration(
                //color:AppColors.nutral400,
                  borderRadius:BorderRadius.circular(12),
                  border:Border.all(color:AppColors.blackcolor.withOpacity(0.2))
              ),
              child:ListTile(
                leading:CircleAvatar(
                  radius:30,
                ),
                title:Padding(
                  padding:EdgeInsets.only(bottom:1.h),
                  child: Text("The Univercity of Arizona"),
                ),
                subtitle:Text("Bachelor of art and design"),
                trailing:Padding(
                  padding:EdgeInsets.only(top:4.h),
                  child: SvgPicture.asset(AppImages.edit_pen),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
