import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/complete_profile_cubit/complete_profile_cubit.dart';
import '../../screens/complete_profile/complete_profile.dart';
import '../../widgets/prgogress_indicator.dart';

class CompleteProfileStepState extends StatelessWidget {
  const CompleteProfileStepState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>CompleteProfile())
        );
      },
      child: Container(
        padding:EdgeInsets.only(left:15,right:15,top:4,bottom:4),
        height:15.h,
        width:90.w,
        decoration: BoxDecoration(
          border:Border.all(color:AppColors.nutral400),
          borderRadius:BorderRadius.circular(10),
        ),
        child:Row(
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        AppStrings.completed2(CompleteProfileCubit.get(context).currentStep*25),
                      maxLines:2,
                      style:TextStyle(
                          fontSize:14.sp,
                          fontWeight:FontWeight.w600
                      ),
                      ),
                    ),
                    SizedBox(height:1.h,),
                    Flexible(
                        child:Text(AppStrings.complete_your_profile_and,
                          maxLines:3,
                          style:TextStyle(
                            color:AppColors.nutralcolor,
                            fontSize:11.8.sp
                          ),)),
                  ],
                ),

            ),
            SizedBox(width:2,),
            ProgressIndicatorTool(
              totalSteps: 100,
              currentStep:CompleteProfileCubit.get(context).currentStep*25,
              stepSize: 2.w,
              selectedColor: AppColors.primrycolor,
              unselectedColor: AppColors.nutral300,
              padding: 0,
              height: 25.w,
              width: 25.w,
              selectedStepSize: 1.8.w
              , roundedCap: (int , bool ) =>true,
              child: Center(
                child:Text("${CompleteProfileCubit.get(context).currentStep*25}%",style:TextStyle(
                    color:AppColors.primrycolor,
                    fontSize:20.sp,
                    fontWeight:FontWeight.w500
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
