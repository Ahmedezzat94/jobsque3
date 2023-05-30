import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../blocs/complete_profile_cubit/complete_profile_cubit.dart';

class UploadPortofolioFielCard extends StatelessWidget {
  File file;
  void Function()? onCloseIconTap;
  UploadPortofolioFielCard({Key? key,required this.file,this.onCloseIconTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit,CompleteProfileState>(
      listener: (BuildContext context, Object? state) {

      },
      builder: (BuildContext context, state) =>
          Container(
            height:10.h,
            width: 90.w,
            decoration:BoxDecoration(
              border:Border.all(color:AppColors.nutral300),
              borderRadius:BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:EdgeInsets.only(left:4.w),
                      child: (file != null)?
                      Image.file(file):SizedBox(),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top:2.5.h,left:2.w),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text("CV upload",style:TextStyle(fontWeight:FontWeight.w500),),
                          SizedBox(height:1.h,),
                          Text(CompleteProfileCubit.get(context).pickedFile!.name,style:TextStyle(color:AppColors.nutral400))
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:EdgeInsets.only(right:3.5.w),
                  child: Row(
                    children: [
                      InkWell(
                          onTap:(){
                            //CompleteProfileCubit.get(context).pickFile();
                          },
                          child: SvgPicture.asset(AppImages.edit_pen)),
                      SizedBox(width:1.w,),
                      InkWell(
                          onTap:onCloseIconTap,
                          child:SvgPicture.asset(AppImages.close_circle))
                    ],
                  ),
                )
              ],
            ),
          ),

    );
  }
}
