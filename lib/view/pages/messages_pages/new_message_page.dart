import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../components/home_page_components/search_bar.dart';
import '../../components/message_page_component/bottom_sheet.dart';
import '../../components/message_page_component/filter_switch.dart';
import '../../components/message_page_component/message_page_header.dart';

class NewMessagesPage extends StatelessWidget {
  const NewMessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
  children: [
    MessagePageHeader(),
    SizedBox(
      height: 2.h,
    ),
    Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
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
    Expanded(
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
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
);
  }
}
