import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/utilities/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.onTap,
      this.controller,
      this.onChange,
      this.onSubmit,
      this.icon,
      this.hinttext,
      this.labeltext})
      : super(key: key);

  //var search_text_controller = TextEditingController();
  String? labeltext;
  String? hinttext;
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
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.spikcolor),
              borderRadius: BorderRadius.circular(2.w),
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
