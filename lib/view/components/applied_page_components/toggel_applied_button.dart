import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';

class ToggleAppliedButton extends StatefulWidget {
  ToggleAppliedButton({Key? key}) : super(key: key);

  @override
  State<ToggleAppliedButton> createState() => _ToggleAppliedButtonState();
}

class _ToggleAppliedButtonState extends State<ToggleAppliedButton> {
  int _tabTextIndexSelected =0;

  List<String>_listTextTabToggle = [AppStrings.Active,AppStrings.Rejected];

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
// width in percent
      width: 90,
      borderRadius: 30,
      height: 50,
      selectedIndex: _tabTextIndexSelected,
      selectedBackgroundColors: [AppColors.secondrycolor,],
      selectedTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      unSelectedTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      labels: _listTextTabToggle,
      selectedLabelIndex: (index) {
        setState(() {
          _tabTextIndexSelected = index;
        });
      },
      isScroll: false,
    );
  }
}
