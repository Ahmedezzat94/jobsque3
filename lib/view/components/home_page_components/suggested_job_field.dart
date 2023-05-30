import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/job_details_cubit/job_details_cubit.dart';
import '../../blocs/suggested_job_cubit/suggested_job_cubit.dart';
import '../../widgets/main_button.dart';

class SuggestedJobField extends StatefulWidget {
  const SuggestedJobField({Key? key}) : super(key: key);

  @override
  State<SuggestedJobField> createState() => _SuggestedJobFieldState();
}

class _SuggestedJobFieldState extends State<SuggestedJobField> {
  @override
  void initState() {
    SuggestedJobCubit.get(context).getSuggestedJob(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: BlocConsumer<SuggestedJobCubit, SuggestedJobState>(
        listener: (BuildContext context, Object? state) {

        },
        builder: (BuildContext context, state) {
          if(state is GetSuggestedJobSuccess){
            return ListView.separated(
              itemCount: GetSuggestedJobSuccess.suggestedjobs!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      color: (index == 0)
                          ? AppColors.secondrycolor
                          : Colors.grey.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        leading: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.asset(AppImages.amit)),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: (state is GetSuggestedJobIsLoading)
                              ? CircularProgressIndicator()
                              : Text(
                            "${GetSuggestedJobSuccess.suggestedjobs![index].name}",
                            style: TextStyle(
                                color: (index == 0)
                                    ? AppColors.textcolor
                                    : AppColors.blackcolor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        subtitle: Text(
                            "${GetSuggestedJobSuccess.suggestedjobs![index].compEmail}",
                            style: TextStyle(
                                color: (index == 0)
                                    ? AppColors.nutral400
                                    : AppColors.blackcolor)),
                        trailing: SvgPicture.asset((index == 0)
                            ? AppImages.whight_archive
                            : AppImages.black_archive),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding:EdgeInsets.all(10),
                            height: 4.h,
                            //width: 26.w,
                            decoration: BoxDecoration(
                              color: (index == 0)
                                  ? Colors.white.withOpacity(0.14)
                                  : Colors.blueAccent.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "${GetSuggestedJobSuccess.suggestedjobs![index].jobTimeType}",
                              style: TextStyle(
                                  color: (index == 0)
                                      ? AppColors.textcolor
                                      : AppColors.primrycolor),
                            ),
                          ),
                          SizedBox(width:2.w,),
                          Container(
                            alignment: Alignment.center,
                            padding:EdgeInsets.all(10),
                            height: 4.h,
                            //width: 26.w,
                            decoration: BoxDecoration(
                              color: (index == 0)
                                  ? Colors.white.withOpacity(0.14)
                                  : Colors.blueAccent.withOpacity(0.14),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "${GetSuggestedJobSuccess.suggestedjobs![index].jobType}",
                              style: TextStyle(
                                  color: (index == 0)
                                      ? AppColors.textcolor
                                      : AppColors.primrycolor),
                            ),
                          ),
                          SizedBox(width:2.w,),
                          Container(
                            alignment: Alignment.center,
                            padding:EdgeInsets.all(10),
                            height: 4.h,
                            //width: 26.w,
                            decoration: BoxDecoration(
                              color: (index == 0)
                                  ? Colors.white.withOpacity(0.14)
                                  : Colors.blueAccent.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "${GetSuggestedJobSuccess.suggestedjobs![index].jobLevel}",
                              style: TextStyle(
                                  color: (index == 0)
                                      ? AppColors.textcolor
                                      : AppColors.primrycolor),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$${GetSuggestedJobSuccess.suggestedjobs![index].salary}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: (index == 0)
                                          ? AppColors.textcolor
                                          : AppColors.blackcolor),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "/${AppStrings.Month}",
                                    style: TextStyle(
                                        fontSize: 9.sp, color: AppColors.nutral400),
                                  ),
                                )
                              ],
                            ),
                            MainButton(
                              height: 4.h,
                              width: 25.w,
                              text: AppStrings.Applynow,
                              textcolor: AppColors.textcolor,
                              color: AppColors.primrycolor,
                              onTab: () {
                                JobDetailsCubit.suggestedJob =
                                GetSuggestedJobSuccess.suggestedjobs?[index];
                                JobDetailsCubit.get(context).navigateToJobDetails(
                                    context,
                                    GetSuggestedJobSuccess.suggestedjobs![index]);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 5.w,
                );
              },
            );
          }else if(state is GetSuggestedJobFailed){
            return SizedBox();
          }else{
           return Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}
