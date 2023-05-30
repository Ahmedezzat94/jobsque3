import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../blocs/complete_profile_cubit/complete_profile_cubit.dart';
import '../../../components/home_page_components/head_section.dart';
import '../../../widgets/inputfield.dart';
import '../../../widgets/main_button.dart';
import '../../../widgets/number_inputfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit,CompleteProfileState>(
      listener: (BuildContext context, Object? state) {

      },
      builder: (BuildContext context, state) =>
       Scaffold(
        backgroundColor:AppColors.textcolor,
        appBar:AppBar(
          backgroundColor:AppColors.textcolor,
          elevation: 0,
          leading:IconButton(
            onPressed: () {
              CompleteProfileCubit.get(context).onPersonDetailsValidate(context);
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),),
          title:Text(AppStrings.Edit_Profile,style:TextStyle(color:AppColors.blackcolor),),
        ),
        body:Form(
          key:CompleteProfileCubit.get(context).personalDetailsformKey,
          child: Center(
            child: Column(
              children: [
               CircleAvatar(
                 radius: 15.w,
               ),
                TextButton(
                    onPressed: (){},
                    child: Text(AppStrings.Change_Photo,style:TextStyle(color:AppColors.primrycolor),)),
                Padding(
                  padding:EdgeInsets.only(left:5.w),
                  child: HeadSection(
                    LeftText:AppStrings.Name,
                    LeftTextcolor:AppColors.nutralcolor,
                    RightText: "",
                  ),
                ),
                InputField(
                  controller: CompleteProfileCubit.get(context).nameController,
                    validation: (value){
                      if(value.isEmpty){
                        return "enter your name";
                      }
                    }
                ),
                Padding(
                  padding:EdgeInsets.only(left:5.w),
                  child: HeadSection(
                    LeftText:AppStrings.Bio,
                    LeftTextcolor:AppColors.nutralcolor,
                    RightText: "",
                  ),
                ),
                InputField(
                  controller:CompleteProfileCubit.get(context).bioController,
                    validation: (value){
                      if(value.isEmpty){
                        return "enter a bio about your self";
                      }
                    }),
                Padding(
                  padding:EdgeInsets.only(left:5.w),
                  child: HeadSection(
                    LeftText:AppStrings.Address,
                    LeftTextcolor:AppColors.nutralcolor,
                    RightText: "",
                  ),
                ),
                InputField(
                  controller:CompleteProfileCubit.get(context).adressController,
                    validation: (value){
                      if(value.isEmpty){
                        return "enter your adress";
                      }
                    }
                    ),
                Padding(
                  padding:EdgeInsets.only(left:5.w),
                  child: HeadSection(
                    LeftText:AppStrings.No_Handphone,
                    LeftTextcolor:AppColors.nutralcolor,
                    RightText: "",
                  ),
                ),
                NumberInputField(
                  controller:CompleteProfileCubit.get(context).phontNumController,
                    validation: (value){
                      if(value.isEmpty){
                        return "enter your phone number";
                      }
                    }
                ),
                SizedBox(height:8.h,),
                MainButton(
                  height: 6.h,
                  width: 80.w,
                  color:AppColors.primrycolor,
                  text:AppStrings.Save,
                  textcolor:AppColors.textcolor,
                  fontWeight:FontWeight.w500,
                  onTab: (){
                    CompleteProfileCubit.get(context).onPersonDetailsValidate(context);
                  },
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
