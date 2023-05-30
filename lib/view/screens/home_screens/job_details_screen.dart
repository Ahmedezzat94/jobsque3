import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../../domin/entities/suggested_job/suggested_job_entity.dart';
import '../../blocs/job_details_cubit/job_details_cubit.dart';
import '../../components/job_details_components/job_field.dart';
import '../../components/job_details_components/job_time_chips.dart';
import '../../components/job_details_components/page_header.dart';
import '../../components/job_details_components/toggel_pages_button.dart';
import '../../widgets/main_button.dart';


class JobDetailsScreen extends StatelessWidget {
  SuggestedJob suggestedJob;
  JobDetailsScreen({Key? key,required this.suggestedJob}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailsCubit, JobDetailsState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) => Scaffold(
        backgroundColor:AppColors.textcolor,
          body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PageHeader(),
                ),
                SizedBox(
                  height: 3.h,
                ),
                JobField(jobName:"${suggestedJob.name}", location: '${suggestedJob.location}', companyName: '${suggestedJob.compName}', image: '${suggestedJob.image}',),
                SizedBox(
                  height: 1.5.h,
                ),
                JobTimeChip(jobtimetype: '${suggestedJob.jobTimeType}', jobtype: '${suggestedJob.jobType}', joblevel: '${suggestedJob.jobLevel}',),
                SizedBox(
                  height: 3.5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: ToggelPagesButton(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                // SizedBox(
                //   height: 49.h,
                 // child:
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 6.w, right: 6.w),
                          height: 60.h,
                          color: AppColors.textcolor,
                          width: double.infinity,
                          child: JobDetailsCubit.get(context).pages.elementAt(
                              JobDetailsCubit.get(context).textButtonTap),
                        ),
                      ],
                    ),
                  ),
                //)
              ],
            ),
            MainButton(
              height: 6.h,
              width: 85.w,
              text: AppStrings.Applynow,
              fontWeight: FontWeight.w500,
              textcolor: AppColors.textcolor,
              color: AppColors.primrycolor,
              onTab:(){
                JobDetailsCubit.get(context).navigateToApplyJob(context);
              },
            ),
          ],
        ),
      )),
    );
  }
}
