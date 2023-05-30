import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/home_screen_cubit/main_layout_cubit.dart';
import '../../components/saved_page_components/page_head.dart';
import '../../components/saved_page_components/saved_job_card.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor:AppColors.textcolor,
          elevation: 0,
          leading:IconButton(
            onPressed: () {
              MainLayOutCubit.get(context).OnBackArrowTap();
            },
            icon:Icon(Icons.arrow_back_outlined,color:AppColors.blackcolor,),
          ),
          title: Text(AppStrings.Saved,style:TextStyle(color:AppColors.blackcolor),),
        ),
        PageHead(),
        SizedBox(
          height:70.h,
          child: ListView.separated(
             separatorBuilder:(context,index)=> Divider(
               color: AppColors.nutralcolor,
               endIndent:5.w ,
               indent:5.w ,
             ),
              itemCount: 8,
              itemBuilder: (context,index)=>
              SavedJobCard()

          ),
        ),
      ],
    );
  }
}
