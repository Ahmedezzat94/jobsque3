import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../components/screens_of_logos/success_account_logo.dart';
import '../../components/success_state_text.dart';

class AccountSetUpPage extends StatelessWidget {
  const AccountSetUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: AppColors.textcolor,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.blackcolor,
            ),
          ),
          elevation: 0,
        ),
        SizedBox(
          height: 15.h,
        ),
        SuccessAcountLogo(),
        SizedBox(
          height: 4.h,
        ),
        SuccessStateText()
      ],
    );
  }
}
