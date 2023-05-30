import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../blocs/two_step_vrify_cubit/two_step_verification_cubit.dart';
import '../../../widgets/flutter_toggel_switch.dart';

class SecureSwitchCard extends StatelessWidget {
  const SecureSwitchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TwoStepVerificationCubit,TwoStepVerificationState>(
      listener: (BuildContext context, Object? state) {
        if(state is TwoStepVerificationTrue){
          print("true ya 3m");
        }else{
          print("false ya sedy");
        }
      },
      builder: (BuildContext context, state) =>
          Container(
        height:8.h,
        width: 90.w,
        padding:EdgeInsets.only(left:3.w,right:3.w),
        decoration:BoxDecoration(
          border:Border.all(
            color:AppColors.nutral400,
          ),
          borderRadius:BorderRadius.circular(10)
        ),
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width:50.w,
              child: Text(AppStrings.Secure_your_account,
              maxLines:2,
              style:TextStyle(
                color:AppColors.nutralcolor,
                fontSize:12.sp
              ),
              ),
            ),
            FlutterSwitch(
              onChanged:(value){
                TwoStepVerificationCubit.get(context).onSwitchTap(value);
                print(value);
              },
              isSelected:TwoStepVerificationCubit.get(context).twoStepVerificationIsSelected,)
          ],
        ),
      ),
    );
  }
}
