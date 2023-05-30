import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../components/home_page_components/search_bar.dart';
import '../../components/message_page_component/bottom_sheet.dart';
import '../../components/message_page_component/filter_switch.dart';
import '../../components/message_page_component/message_page_header.dart';
import '../../widgets/custome_text.dart';

class NoMessagesPage extends StatelessWidget {
  const NoMessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: 15.h,
        ),
        SvgPicture.asset(
            AppImages.no_message_icon
        ),
        SizedBox(
          height: 1.h,
        ),
        CustomText(
          text:AppStrings.You_have_not_received_any_messages,
          fontSize:20.sp,
          fontWeight:FontWeight.w600,
          maxLines:2,
          textAlign:TextAlign.center,
        ),
        
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomText(
            text:AppStrings.Once_your_application_has_reached_the_interview_stage,
            fontSize:12.sp,
            maxLines: 2,
            textAlign:TextAlign.center,
            color:AppColors.nutralcolor,
          ),
        )
      ],
    );
  }
}
