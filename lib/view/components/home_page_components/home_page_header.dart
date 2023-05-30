import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/profile_cubit/profile_cubit.dart';
import '../../screens/notification_screen/notification_screen.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Padding(
        padding:EdgeInsets.only(bottom:1.1.h),
        child: FutureBuilder(
          future:ProfileCubit.get(context).authLocalDataSourceImpl2.getUserName ,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)=>
              Text("Hi ${snapshot.data} 👋",
            style:TextStyle(fontSize:20.sp,fontWeight:FontWeight.w600),),
        ),
      ),
      subtitle:Text(AppStrings.Create_a_better_future,
          style:TextStyle(fontSize:12.sp,color:AppColors.nutralcolor)),
      trailing:InkWell(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>NotificationScreen())
          );
        },
        child: Container(
          padding: EdgeInsets.all(1.5.h),
          decoration:BoxDecoration(
            shape:BoxShape.circle,
            color:AppColors.textcolor,
            border:Border.all(color:AppColors.nutralcolor),

          ),
          child:SvgPicture.asset(AppImages.notification_bell),
        ),
      ) ,
    );
  }
}
