import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../blocs/complete_profile_cubit/complete_profile_cubit.dart';
import '../../../components/complete_profile_components/add_file_for_portofolio.dart';
import '../../../components/complete_profile_components/upload_portofolio_file_card.dart';
import '../../../components/home_page_components/head_section.dart';

class Portofolio extends StatelessWidget {
  const Portofolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit,CompleteProfileState>(
      listener: (BuildContext context, Object? state) {

      },
      builder: (BuildContext context, state) =>
          Scaffold(
        backgroundColor:AppColors.textcolor,
        appBar:AppBar(
          elevation:0,
          backgroundColor:AppColors.textcolor,
          leading:IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: AppColors.blackcolor,),),
          title: Text(AppStrings.Portfolio,style:TextStyle(color:AppColors.blackcolor),),
        ),
        body: Column(
          children: [
            SizedBox(height:3.h,),
            Padding(
              padding:EdgeInsets.only(left:6.w),
              child: HeadSection(
                LeftText:AppStrings.Add_portfolio_here,
                fontsize_lefttext:16.sp,
                fontWeight_lefttext:FontWeight.w300,
                RightText:"",
              ),
            ),
            AddFileForPortofolio(),
            SizedBox(height:3.h,),
            Flexible(
                child:ListView.separated(
                  itemCount: CompleteProfileCubit.get(context).files.length,
                  shrinkWrap: true,
                    padding:EdgeInsets.only(left:6.w,right:6.w),
                    itemBuilder: (context,index) =>
                        UploadPortofolioFielCard(
                          file:CompleteProfileCubit.get(context).files[index],
                          onCloseIconTap:(){
                            CompleteProfileCubit.get(context).removeFile(index);
                          } ,
                        )
                  , separatorBuilder: (BuildContext context, int index) => SizedBox(height:2.h,),
                )
            )
          ],
        )
      ),
    );
  }
}
