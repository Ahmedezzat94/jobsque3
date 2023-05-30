import 'package:flutter/material.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/home_screen_cubit/main_layout_cubit.dart';

class MessagePageHeader extends StatelessWidget {
  const MessagePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor:AppColors.textcolor,
          leading:IconButton(icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),
            onPressed: () {

            MainLayOutCubit.get(context).OnBackArrowTap();
            }
          ),
          title:Text(AppStrings.Messages,style:TextStyle(color:AppColors.blackcolor),),
        elevation: 0,
        )
      ],
    );
  }
}
