import 'package:flutter/material.dart';

import '../../core/utilities/app_colors.dart';
import '../../core/utilities/app_strings.dart';

class RegisterOrline extends StatelessWidget {
  RegisterOrline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Expanded(
            child:Divider(color:AppColors.blackcolor,)),
         Padding(
           padding: EdgeInsets.only(right: 20,left:20 ),
           child: Text(AppStrings.orsignupwithacc,
             style:TextStyle(fontWeight:FontWeight.w400,
                 fontSize:15,color:AppColors.nutralcolor),),
         ),
        Expanded(
            child: Divider(color:AppColors.blackcolor,))
      ],
    );
  }
}
