import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';


import '../../core/utilities/app_colors.dart';
import '../../core/utilities/app_strings.dart';
import '../blocs/pick_job_cubit/pickjob_cubit.dart';

class ToggleButton extends StatefulWidget {

  ToggleButton({Key? key,}) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
 int tabTextIndexSelected =0;

 List<String>_listTextTabToggle = [AppStrings.workfromoffice,AppStrings.remotwork];

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
// width in percent
      width: 90,
      borderRadius: 30,
      height: 50,
      selectedIndex: PickjobCubit.get(context).tabTextIndexSelected,
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
         PickjobCubit.get(context).tabTextIndexSelected = index;
        });
      },
      isScroll: false,
    );
  }
}
