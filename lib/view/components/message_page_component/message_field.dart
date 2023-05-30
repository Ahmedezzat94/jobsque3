import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';

class MessageField extends StatelessWidget {
  MessageField(
      {Key? key,
        this.onTap,
        this.maxLines,
        this.controller,
        this.onChange,
        this.onSubmit,
        this.icon,
        this.hinttext,
        this.labeltext})
      : super(key: key);

  String? labeltext;
  String? hinttext;
  int? maxLines;
  Widget? icon;
  Function()? onTap;
  Function()? onChange;
  Function()? onSubmit;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: TextField(
        maxLines: maxLines,
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.spikcolor),
              borderRadius: BorderRadius.circular(10.w),
            ),
            prefixIcon: icon,
            hintText: hinttext),
        onChanged: (String) {
          onChange!();
        },
        onSubmitted: (String) => onSubmit!(),
        onTap: () {
          onTap!();
        },
      ),
    );
  }
}
