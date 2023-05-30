import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/job_details_cubit/job_details_cubit.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/number_inputfield.dart';

class BiodataPage extends StatelessWidget {
  BiodataPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailsCubit,JobDetailsState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
          Form(
           key: JobDetailsCubit.get(context).formKey,
             child: Column(
              children: [
               Row(
                children: [
                  Column(
                   mainAxisSize:MainAxisSize.max,
                   children: [
                    Padding(
                      padding:EdgeInsets.only(right:70.0.w,top:2.h,bottom: 1.h),
                      child: Text(AppStrings.Biodata,
                        style:TextStyle(fontWeight:FontWeight.w600,fontSize:14.sp),),

                    ),
                    Padding(
                      padding:EdgeInsets.only(right:40.w,bottom:2.h),
                      child:Text(AppStrings.Fill_in_your_bio_data_correctly,
                        style:TextStyle(color:AppColors.nutralcolor),),
                    ),
                    Padding(
                      padding:EdgeInsets.only(right:70.w,top:1.h,bottom:1.h),
                      child: Text(AppStrings.Full_Name,),
                    ),
                    SizedBox(
                      height:8.h,
                      width:100.w,
                      child: InputField(
                        onChange:  (text){
                          JobDetailsCubit.get(context).onNameFieldChange();
                        },
                        controller:JobDetailsCubit.get(context).name_controller,
                          preIcon:Image.asset(AppImages.profile_icon),
                          validation: (value){
                            if(value.isEmpty){
                              return "Please enter you name";
                            }else{
                              state is FieldIsNotEmpty;
                            }
                          }),
                    ),
                    Padding(
                      padding:EdgeInsets.only(right:80.w,top:1.h,bottom:1.h),
                      child: Text(AppStrings.email,),
                    ),
                    SizedBox(
                      height:8.h,
                      width:100.w,
                      child: InputField(
                        onChange:  (text){
                          JobDetailsCubit.get(context).onEmailFieldChange();
                        },
                          controller:JobDetailsCubit.get(context).email_controller,
                          preIcon:Image.asset(AppImages.sms_icon),
                          validation: (value){
                            if(value.isEmpty){
                              return "Please enter your email";
                            }else{
                              state is FieldIsNotEmpty;
                            }
                          }),
                    ),
                    Padding(
                      padding:EdgeInsets.only(right:65.w,top:1.h,bottom:1.h),
                      child: Text(AppStrings.No_Handphone,),
                    ),
                    SizedBox(
                      height:20.h,
                      width:100.w,
                      child: NumberInputField(
                        //onChange:(text){JobDetailsCubit.get(context).onPhoneFieldChange();} ,
                        validation: (value){
                          if(value.isEmpty){
                            return "insert you num";
                          }else{
                            state is FieldIsNotEmpty;
                          }
                        }, controller: JobDetailsCubit.get(context).phone_controller,

                        ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
