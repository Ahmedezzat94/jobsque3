import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../components/home_page_components/head_section.dart';
import '../../components/home_page_components/search_bar.dart';
import '../../components/message_page_component/bottom_sheet.dart';
import '../../components/message_page_component/filter_switch.dart';

import 'chat_page.dart';

class UnreadMessages extends StatelessWidget {
  const UnreadMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar: AppBar(
        elevation:0,
        backgroundColor:AppColors.textcolor,
        leading:IconButton(onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),
        ),
        title:Text(AppStrings.Messages,style:TextStyle(color:AppColors.blackcolor),),
      ),
      body: Column(
        children: [
          //MessagePageHeader(),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding:EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                Expanded(child: SearchBar()),
                SizedBox(
                  width: 3.w,
                ),
                FilterSwitch(
                  ontap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => CustomBottomSheet());
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            padding:EdgeInsets.only(left:6.w,right:4.w),
            color:AppColors.nutral201,
            height:4.5.h,
            child: HeadSection(
              LeftText:AppStrings.Unread,
              LeftTextcolor:AppColors.nutralcolor,
              RightText:AppStrings.Read_all_messages,
              onTap: (){},
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                    Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>ChatPage())
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: AppColors.textcolor,
                    child: SvgPicture.asset(AppImages.zoom_icon),
                  ),
                  title: Text(
                    "Twitter",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("Ahmedezzat@gmail.com"),
                  trailing: Text("yesterday"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
