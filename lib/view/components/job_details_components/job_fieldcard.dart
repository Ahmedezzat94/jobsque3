import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../blocs/job_details_cubit/job_details_cubit.dart';



class JobFieldCard extends StatefulWidget {
  int? index ;
  void Function()? onTap;

  JobFieldCard({Key? key, required this.index,this.onTap}) : super(key: key);

  @override
  State<JobFieldCard> createState() => _JobFieldCardState();
}

class _JobFieldCardState extends State<JobFieldCard> {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<JobDetailsCubit, JobDetailsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(15),
        height: 11.h,
        width: 40.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: (JobDetailsCubit.get(context).isSelected == widget.index)
                    ? AppColors.primrycolor
                    : AppColors.nutral300,
                width: 1.5),
            color: (JobDetailsCubit.get(context).isSelected == widget.index)
                ? AppColors.primrycolor.withOpacity(0.2)
                : AppColors.textcolor),
        duration: Duration(milliseconds: 500),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:EdgeInsets.only(top:8.0),
              child: Column(
                children: [
                  Text("Senior UI Designer",style:TextStyle(fontWeight:FontWeight.w600),),
                  SizedBox(height:1.h,),
                  Text("Cv.pdf portofolio",style:TextStyle(color:AppColors.nutral400),)

                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.only(right:2.0.w,top:2.h),
              child: AnimatedContainer(
                  height: 5.w,
                  width: 5.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: (JobDetailsCubit.get(context).isSelected == widget.index)
                              ? AppColors.primrycolor
                              : AppColors.nutral300),
                      borderRadius: BorderRadius.circular(13.6.w),
                      color: AppColors.textcolor),
                  duration: Duration(milliseconds: 500),
                  child: Center(
                      child: Container(
                        height:3.w,
                        width: 3.w,
                        decoration:BoxDecoration(
                          color:(JobDetailsCubit.get(context).isSelected== widget.index)?AppColors.primrycolor:AppColors.textcolor,
                          borderRadius:BorderRadius.circular(20.w)
                        ),

                      ))),
            ),

          ],
        ),
      ),
    );
  },
);
  }
}
