import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/utilities/app_colors.dart';
import '../../core/utilities/app_strings.dart';
import '../blocs/pick_job_cubit/pickjob_cubit.dart';
import '../widgets/custome_text.dart';

class FieldCard extends StatefulWidget {
  WorkField workField;
  // bool isSelected = false;
  // Widget? icon;
  // String? text;
  // String? image;
  FieldCard({Key? key,required this.workField}) : super(key: key);



  @override
  State<FieldCard> createState() => _FieldCardState();
}

class _FieldCardState extends State<FieldCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.workField.isSelected = !widget.workField.isSelected;
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(15),
        height: 15.h,
        width: 40.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: (widget.workField.isSelected == true)
                    ? AppColors.primrycolor
                    : AppColors.nutral300,
                width: 1.5),
            color: (widget.workField.isSelected == true)
                ? AppColors.primrycolor.withOpacity(0.2)
                : AppColors.textcolor),
        duration: Duration(milliseconds: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
                height: 13.6.w,
                width: 13.6.w,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (widget.workField.isSelected == true)
                            ? AppColors.primrycolor
                            : AppColors.nutral300),
                    borderRadius: BorderRadius.circular(13.6.w),
                    color: AppColors.textcolor),
                duration: Duration(milliseconds: 500),
                child: Center(
                    child:Image.asset("${widget.workField.image}",)
                )),
            SizedBox(height:3.h,),
            CustomText(text:widget.workField.jopName!)
          ],
        ),
      ),
    );
  }
}
