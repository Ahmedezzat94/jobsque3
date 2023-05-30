import 'package:flutter/material.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/complete_profile_cubit/complete_profile_cubit.dart';



class CheckBoxAndExperience extends StatefulWidget {
  bool isBoxChecked ;
  CheckBoxAndExperience({Key? key,this.isBoxChecked=false}) : super(key: key);

  @override
  State<CheckBoxAndExperience> createState() => _CheckBoxAndExperienceState();
}

class _CheckBoxAndExperienceState extends State<CheckBoxAndExperience> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                side:BorderSide(strokeAlign: 1,),
                value:CompleteProfileCubit.get(context).isBoxChecked,
                activeColor:AppColors.primrycolor,
                onChanged: (checked){
                  CompleteProfileCubit.get(context).onCheckBoxTap();
                  // setState(() {
                  //   isChecked = checked!;
                  // });
                }
            ),
            Text(AppStrings.I_am_currently,
            style:TextStyle(
              fontWeight:FontWeight.w600
            ),
            ),
          ],
        ),

      ],
    );
  }
}
