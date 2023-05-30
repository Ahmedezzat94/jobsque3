import 'package:flutter/material.dart';

import '../../core/utilities/app_colors.dart';
import '../../core/utilities/app_strings.dart';
import '../screens/auth_screens/reset_pass_screen.dart';
import '../widgets/custome_texbutton.dart';

class CheckBoxAndForgetPass extends StatefulWidget {
   CheckBoxAndForgetPass({Key? key}) : super(key: key);

  @override
  State<CheckBoxAndForgetPass> createState() => _CheckBoxAndForgetPassState();
}

class _CheckBoxAndForgetPassState extends State<CheckBoxAndForgetPass> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: isChecked,
                activeColor:AppColors.primrycolor,
                onChanged: (checked){
                  setState(() {
                    isChecked = checked!;
                  });
                }
            ),
            Text(AppStrings.rememberme),
          ],
        ),
        CustomTextButton(
          text: AppStrings.forgetpassword,
          color:AppColors.primrycolor,
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
          },
        )
      ],
    );
  }
}
