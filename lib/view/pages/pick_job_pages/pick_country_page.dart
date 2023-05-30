import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/pick_job_cubit/pickjob_cubit.dart';
import '../../components/country_field_card.dart';
import '../../components/headlines/pick_country_headline.dart';
import '../../components/toggle_button.dart';
import '../../widgets/custome_text.dart';

class PickCountryPage extends StatefulWidget {
   PickCountryPage({Key? key}) : super(key: key);

  @override
  State<PickCountryPage> createState() => _PickCountryPageState();
}

class _PickCountryPageState extends State<PickCountryPage> {
  int currentindex = 0;
bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:5.w,vertical:3.h),
          child: PickCountryHeadLine(),
        ),
        SizedBox(height:1.h,),
        ToggleButton(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:5.w,vertical:3.h),
          child: Row(
            children: [
              CustomText(text:AppStrings.selectthecountry,
              fontSize:12.sp,
                color:AppColors.nutralcolor,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:5.w,),
          child: Wrap(
            spacing: 10,
              runSpacing:15,
              children: List.generate(PickjobCubit.get(context).listOfCountryFields.length,
                      (index) => CountryFieldCard(countryField: PickjobCubit.get(context).listOfCountryFields[index],))
                
          ),
        )
      ],
    );
  }
}
