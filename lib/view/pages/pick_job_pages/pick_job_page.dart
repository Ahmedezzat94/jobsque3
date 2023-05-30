import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../blocs/pick_job_cubit/pickjob_cubit.dart';
import '../../components/field_card.dart';
import '../../components/headlines/set_up_headline.dart';

class PickJobPage extends StatelessWidget {
   PickJobPage({Key? key,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:EdgeInsets.symmetric(horizontal:5.w,vertical:3.h),
          child: SetUpAccHeadLine(),
        ),
        SizedBox(
          height:69.h,
          width: 90.w,
          child: GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                childAspectRatio: 5/4,
                crossAxisSpacing:15,
                mainAxisSpacing:20
              ),
            itemCount:PickjobCubit.get(context).listOfWorkFields.length,
            itemBuilder: (BuildContext context, int index) {
                return FieldCard(
                   workField: PickjobCubit.get(context).listOfWorkFields[index],
                );
            },
          ),
        )
      ],
    );
  }
}
