import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utilities/app_colors.dart';


class PickJobTypeField extends StatefulWidget {
  bool isSelected = false;
  String text;
  IconData? icon;
  PickJobTypeField({
    Key? key,
    required this.isSelected,
    required this.text,
    this.icon
  }) : super(key: key);

  @override
  State<PickJobTypeField> createState() => _PickJobTypeFieldState();
}

class _PickJobTypeFieldState extends State<PickJobTypeField> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: AnimatedContainer(
        width:25.w,
        padding: EdgeInsets.all(8.0),
        duration: Duration(milliseconds:300),
        decoration:BoxDecoration(
          border:Border.all(color:(widget.isSelected==true)?AppColors.primrycolor:AppColors.spikcolor,width:1.5),
          borderRadius:BorderRadius.circular(30),
          color: (widget.isSelected==true)?AppColors.primrycolor.withOpacity(0.2):AppColors.textcolor,
        ),
        child:Row(
          mainAxisSize:MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.text,style:TextStyle(fontSize:10.sp),),
          ],
        ),

      ),
    );
  }
}
