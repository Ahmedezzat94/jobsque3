import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';

class EmailWebsiteField extends StatelessWidget {
  String email;
  String webSite;
   EmailWebsiteField({Key? key,required this.email,required this.webSite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          height: 7.h,
          width: 43.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.nutral300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
               Text(
                  AppStrings.email,
                  style: TextStyle(color: AppColors.nutral400),
                ),

              Text(
                email,
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: 7.h,
          width: 43.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.nutral300),
              borderRadius: BorderRadius.circular(10)),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                    AppStrings.Website,
                    style: TextStyle(color: AppColors.nutral400),
                  ),

                Text(
                  webSite,
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
