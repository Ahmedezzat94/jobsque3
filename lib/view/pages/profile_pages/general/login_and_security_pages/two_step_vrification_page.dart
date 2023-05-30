import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/utilities/app_colors.dart';
import '../../../../../core/utilities/app_strings.dart';
import '../../../../blocs/two_step_vrify_cubit/two_step_verification_cubit.dart';
import '../../../../components/profile_page_components/two_step_verify_components/secure_switche_card.dart';
import '../../../../components/profile_page_components/two_step_verify_components/two_step_info_card.dart';
import '../../../../components/profile_page_components/two_step_verify_components/verification_method_card.dart';
import '../../../../widgets/main_button.dart';
import 'two_step_verification2.dart';

class TwoStepVerificatiion extends StatelessWidget {
  const TwoStepVerificatiion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TwoStepVerificationCubit,TwoStepVerificationState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
       Scaffold(
        backgroundColor:AppColors.textcolor,
        appBar:AppBar(
          backgroundColor:AppColors.textcolor,
          leading:IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),),
          title:Text(AppStrings.Two_step_verification,style:TextStyle(
              color:AppColors.blackcolor
          ),),
          elevation:0,
        ),
        body:Stack(
          children: [
            Column(
              children: [
                SizedBox(height:2.h,),
                SecureSwitchCard(),
                SizedBox(height:4.h,),
                (state is TwoStepVerificationTrue)
                    ?VerificationMethodCard()
                    :TwoStepInfoCard(),
              ],
            ),
            Positioned(
              bottom:5.h,
              left: 5.w,
              child: MainButton(
                height:6.h,
                width:90.w,
                color:AppColors.primrycolor,
                textcolor:AppColors.textcolor,
                text:AppStrings.next,
                fontWeight:FontWeight.w500,
                onTab: (){
                  if(state is TwoStepVerificationTrue){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>TwoStepVerification2()
                        )
                    );
                  }
                },
              ),
            )
          ]
        )
      ),
    );
  }
}
