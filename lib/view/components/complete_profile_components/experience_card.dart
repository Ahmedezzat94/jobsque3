import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/complete_profile_cubit/complete_profile_cubit.dart';
import '../../widgets/custome_text.dart';

class ExperienceCard extends StatefulWidget {
  bool isSelected = false;
  void Function()? onTap;
  ExperienceCard({Key? key, required this.isSelected,this.onTap}) : super(key: key);

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit,CompleteProfileState>(
      listener: (BuildContext context, Object? state) {

      },
      builder: (BuildContext context, state) =>
          GestureDetector(
            onTap: () {
              CompleteProfileCubit.get(context).expereienceIsSelected =
              !CompleteProfileCubit.get(context).educationisSelected;
              // setState(() {
              //   widget.isSelected = !widget.isSelected;
              // });
            },
            child: AnimatedContainer(
                padding: EdgeInsets.only(left:1.w,top:2.h),
                height: 13.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: (CompleteProfileCubit.get(context).step3==1)
                            ? AppColors.primrycolor
                            : AppColors.nutral300,
                        width: 1.5),
                    color: (CompleteProfileCubit.get(context).step3==1)
                        ? AppColors.primrycolor.withOpacity(0.2)
                        : AppColors.textcolor),
                duration: Duration(milliseconds: 500),
                child:ListTile(
                  leading:(CompleteProfileCubit.get(context).step3==1)
                      ?SvgPicture.asset(AppImages.Blue_mark)
                      :SvgPicture.asset(AppImages.unactive_mark,height:4.h,),
                  title:Padding(
                    padding:EdgeInsets.only(bottom:1.h),
                    child: Text(AppStrings.expreience,
                      style:TextStyle(fontSize:14.sp,fontWeight:FontWeight.w600),
                    ),
                  ),
                  subtitle: Text(AppStrings.Enter_your_work_exp),

                  trailing:Icon(Icons.arrow_forward,color:AppColors.blackcolor,),
                  onTap: widget.onTap,
                )
            ),
          ),
    );
  }
}
