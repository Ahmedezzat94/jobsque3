import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key,this.onTap,this.controller,this.onChange,this.onSubmit}) : super(key: key);
  //var search_text_controller = TextEditingController();
  Function()? onTap;
  Function()? onChange;
  Function()? onSubmit;
 TextEditingController? controller ;

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.spikcolor),
              borderRadius: BorderRadius.circular(30.w),
            ),
            prefixIcon: Image.asset(
              AppImages.search_icon,
              color: AppColors.blackcolor,
            ),
            hintText: "${AppStrings.Search}...."),
           onChanged:(String){onChange!();},
          onSubmitted:(String) => onSubmit!(),
          onTap: (){onTap!();},
      );
      }
  }

