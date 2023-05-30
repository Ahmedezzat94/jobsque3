import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../pages/messages_pages/unread_message.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      color: AppColors.textcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            thickness: 1.w,
            color: AppColors.blackcolor,
            endIndent: 43.w,
            indent: 43.w,
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0.w),
            child: Row(
              children: [
                Text(
                  AppStrings.Message_filters,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            height: 6.h,
            width: 85.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.nutral300),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.Unread,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>UnreadMessages()
                          )
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 3.5.w,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            height: 6.h,
            width: 85.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.nutral300),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.Spam,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 3.5.w,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            height: 6.h,
            width: 85.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.nutral300),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.Archived,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 3.5.w,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
