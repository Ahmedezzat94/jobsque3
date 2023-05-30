import 'package:flutter/cupertino.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';

class JobField extends StatelessWidget {
  String image;
  String jobName;
  String companyName;
  String location;

  JobField({Key? key,
    required this.image,
    required this.jobName,
    required this.location,
    required this.companyName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.amit,height:7.h,),
          SizedBox(height:1.h,),
          Text(jobName,
            style:TextStyle(fontSize:16.sp,color:AppColors.blackcolor,fontWeight:FontWeight.w600),),
          SizedBox(height:1.h,),
          Text(textAlign:TextAlign.center ,"${companyName} . ${location}",),
        ],
      ),
    );
  }
}
