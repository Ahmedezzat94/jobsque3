import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../blocs/job_details_cubit/job_details_cubit.dart';
import 'job_fieldcard.dart';

class TypeOfWorkFields extends StatelessWidget {
  const TypeOfWorkFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:55.h,
      width:90.w,
      child: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context,index)=>SizedBox(height:2.h),
        itemBuilder: (context,index)=>JobFieldCard(
          index: index,
          onTap: (){
            JobDetailsCubit.get(context).onJobFieldTap(index);
          },
        ),

      ),
    );
  }
}
