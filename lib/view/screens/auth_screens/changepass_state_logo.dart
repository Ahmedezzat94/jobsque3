import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../components/screens_of_logos/password_changed_logo.dart';
import '../../widgets/custome_text.dart';
import '../../widgets/main_button.dart';
import 'login_screen.dart';

class PassChangedScreen extends StatelessWidget {
  const PassChangedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          PasswordChangedLogo(),
          SizedBox(
            height: 4.h,
          ),
          Container(
            width:60.w,
            child: CustomText(
                text: AppStrings.passworchangedsuccefully,
              fontSize:20.sp,
              fontWeight:FontWeight.w600,
              maxLines:2,
              textAlign:TextAlign.center,
            ),
          ),
          SizedBox(height:2.h,),
          Container(
            padding:EdgeInsets.symmetric(horizontal:5.w),
            child: CustomText(
              text: AppStrings.yourpasswordhasbeenchanged,
              fontSize:12.sp,
              color:AppColors.nutralcolor,
              maxLines:3,
              textAlign:TextAlign.center,
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          MainButton(
            text: AppStrings.openemailapp,
            textcolor: AppColors.textcolor,
            color: AppColors.primrycolor,
            height: 6.h,
            width: 90.w,
            onTab: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>LogingScreen())
              );
            },
          ),
        ],
      ),
    );
  }
}
