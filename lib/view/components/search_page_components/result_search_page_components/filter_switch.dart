import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utilities/app_assets.dart';
import '../filter_search_page_components/filter_bottom_sheet.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:(){
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context)=> FilterBottomSheet()
          );
        },
        child:SvgPicture.asset(AppImages.filter_icon)
    );
  }
}
