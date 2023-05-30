import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../components/email_state_text.dart';
import '../../components/screens_of_logos/check_email_logo.dart';
import '../../widgets/main_button.dart';
import 'creat_new_pass.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          CheckEmailLogo(),
          SizedBox(
            height: 4.h,
          ),
          EmailStateText(),
          SizedBox(
            height: 33.h,
          ),
          MainButton(
            text: AppStrings.openemailapp,
            textcolor: AppColors.textcolor,
            color: AppColors.primrycolor,
            height: 6.h,
            width: 90.w,
            onTab: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CreatNewPassScreen())
              );
            },
          ),
        ],
      ),
    );
  }
}
