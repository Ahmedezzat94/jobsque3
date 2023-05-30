import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../widgets/custome_text.dart';

class NoNotificationState extends StatelessWidget {
  const NoNotificationState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: [
          SizedBox(height:30.h,),
          SvgPicture.asset(AppImages.Notification_logo),
          SizedBox(height:2.h,),
          CustomText(
            text: AppStrings.No_new_notifications_yet,
            fontSize:18.sp,
            fontWeight:FontWeight.w600,
          ),
          SizedBox(height:2.h,),
          Container(
            width:80.w,
            child: CustomText(
              text: AppStrings.You_will_receive_notification,
              fontSize:12.sp,
              color:AppColors.nutralcolor,
              textAlign:TextAlign.center,
              maxLines:2,
            ),
          ),
        ],
      ),
    );
  }
}
