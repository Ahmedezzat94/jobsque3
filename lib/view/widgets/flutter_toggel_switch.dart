import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/utilities/app_colors.dart';

class FlutterSwitch extends StatefulWidget {
  bool isSelected = false;
  final ValueChanged<bool>? onChanged;
  FlutterSwitch({Key? key,required this.isSelected,this.onChanged}) : super(key: key);

  @override
  State<FlutterSwitch> createState() => _FlutterSwitchState();
}

class _FlutterSwitchState extends State<FlutterSwitch> {


  @override
  Widget build(BuildContext context) {
    return Container(
          height:3.h,
          width:12.w,
          decoration:BoxDecoration(
            color:(widget.isSelected == false)?AppColors.spikcolor:AppColors.primrycolor,
            borderRadius:BorderRadius.circular(20)
          ),
          child: Switch(

              value: widget.isSelected,
              activeColor: AppColors.primari100,
              trackColor:MaterialStateColor.resolveWith((states) =>
              (widget.isSelected == false)?AppColors.spikcolor:AppColors.primrycolor),
              onChanged: (value){
                widget.onChanged?.call(value);
                setState(() {
                  widget.isSelected=value;
                });
              }
          ),
        );



  }
}
// Center(
// child: Container(
// child: FlutterSwitch(
// width: 125.0,
// height: 55.0,
// valueFontSize: 25.0,
// toggleSize: 45.0,
// value: status,
// borderRadius: 30.0,
// padding: 8.0,
// showOnOff: true,
// onToggle: (val) {
// setState(() {
// status = val;
// });
// },
// ),
// ),
// );