import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/complete_profile_cubit/complete_profile_cubit.dart';
import '../../components/complete_profile_components/checkbox_experience.dart';
import '../../components/home_page_components/head_section.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/main_button.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({Key? key}) : super(key: key);

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
              CompleteProfileCubit.get(context).onExperienceValidate(context);
              Navigator.pop(context);
              },
            icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),

          ),
          title:Text(AppStrings.expreience,
            style:TextStyle(
                color:AppColors.blackcolor
            ),
          ),
          elevation: 0,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height:75.h,
                  width: 90.w,
                  decoration:BoxDecoration(
                    //color:AppColors.nutral400,
                      borderRadius:BorderRadius.circular(12),
                      border:Border.all(color:AppColors.blackcolor.withOpacity(0.2))
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                        key:CompleteProfileCubit.get(context).expereienceformKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(left:5.w),
                              child: HeadSection(
                                LeftText:AppStrings.Position,
                                LeftTextcolor:AppColors.nutralcolor,
                                RightText: "",
                              ),
                            ),
                            InputField(
                                controller:CompleteProfileCubit.get(context).positionController,
                                validation: (value){
                                  if(value.isEmpty){
                                    return "enter your position";
                                  }
                                }
                            ),
                            Padding(
                              padding:EdgeInsets.only(left:5.w),
                              child: HeadSection(
                                LeftText:AppStrings.Type_of_work,
                                LeftTextcolor:AppColors.nutralcolor,
                                RightText: "",
                              ),
                            ),
                            InputField(
                                controller:CompleteProfileCubit.get(context).typeofworkController,
                                validation: (value){
                                  if(value.isEmpty){
                                    return "enter your type of work";
                                  }
                                }
                            ),
                            Padding(
                              padding:EdgeInsets.only(left:5.w),
                              child: HeadSection(
                                LeftText:AppStrings. Company_name,
                                LeftTextcolor:AppColors.nutralcolor,
                                RightText: "",
                              ),
                            ),
                            InputField(
                                controller:CompleteProfileCubit.get(context).componynameController,
                                validation: (value){
                                  if(value.isEmpty){
                                    return "enter your company name";
                                  }
                                }
                            ),
                            Padding(
                              padding:EdgeInsets.only(left:5.w),
                              child: HeadSection(
                                LeftText:AppStrings.Location,
                                LeftTextcolor:AppColors.nutralcolor,
                                RightText: "",
                              ),
                            ),
                            InputField(
                                controller:CompleteProfileCubit.get(context).locationController,
                                preIcon:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppImages.location,width:1,),
                                ),
                                validation: (value){
                                  if(value.isEmpty){
                                    return "enter your location";
                                  }
                                }
                            ),
                            Padding(
                              padding:EdgeInsets.only(left:2.w),
                              child: CheckBoxAndExperience(isBoxChecked:CompleteProfileCubit.get(context).isBoxChecked,),
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
                                controller:CompleteProfileCubit.get(context).yearStartController,
                                validation: (value){
                                  if(value.isEmpty){
                                    return "enter your started year";
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
                                CompleteProfileCubit.get(context).onExperienceValidate(context);
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
      ),
    );
  }
}
