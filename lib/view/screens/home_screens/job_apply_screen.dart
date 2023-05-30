import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/job_details_cubit/job_details_cubit.dart';
import '../../pages/apply_job_pages/biodata_page.dart';
import '../../pages/apply_job_pages/type_of_work_page.dart';
import '../../pages/apply_job_pages/upload_portfolio_page.dart';
import '../../pages/job_details_pages/jop_applied_state.dart';
import '../../widgets/main_button.dart';

class JobApplyScreen extends StatefulWidget {
  const JobApplyScreen({Key? key}) : super(key: key);

  @override
  State<JobApplyScreen> createState() => _JobApplyScreenState();
}

class _JobApplyScreenState extends State<JobApplyScreen> {
  @override
  void initState() {
    context.read<JobDetailsCubit>().initial();
    JobDetailsCubit.get(context).pageViewController=PageController();
    super.initState();
  }
  @override
  void dispose() {
    JobDetailsCubit.get(context).pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailsCubit, JobDetailsState>(
      listener: (BuildContext context, Object? state) {
        if (state is JobDetailsInitial) {
          print("initiated");
        } else {
          print("processing");
       }
      },
      builder: (BuildContext context, state) => Scaffold(
        backgroundColor: AppColors.textcolor,
        appBar: AppBar(
          backgroundColor: AppColors.textcolor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined, color: AppColors.blackcolor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            AppStrings.Apply_Job,
            style: TextStyle(color: AppColors.blackcolor),
          ),
          elevation: 0,
        ),
        body:Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (state is FieldIsNotEmpty
                        || JobDetailsCubit.get(context).currentIndex==1
                        || JobDetailsCubit.get(context).currentIndex==2)
                        ? SvgPicture.asset(AppImages.Blue_mark)
                        : Container(
                      height: 5.h,
                      width: 11.w,
                      alignment:Alignment.center,
                      decoration:BoxDecoration(
                          border:Border.all(color:(JobDetailsCubit.get(context).currentIndex==0)?AppColors.primrycolor:AppColors.nutral400),
                          borderRadius:BorderRadius.circular(100.w)
                      ),
                      child:Text("1",style:TextStyle(color:AppColors.nutral400,fontWeight:FontWeight.w600),),
                    ),

                    (JobDetailsCubit.get(context).currentIndex==1
                            ||JobDetailsCubit.get(context).currentIndex==2)
                        ?SvgPicture.asset(AppImages.blue_Line)
                        :SvgPicture.asset(AppImages.gray_Line),


                    (JobDetailsCubit.get(context).currentIndex==0)
                        ?SvgPicture.asset(AppImages.gray_two)
                        :(JobDetailsCubit.get(context).currentIndex==1
                        &&JobDetailsCubit.get(context).isSelected!=null)
                        ||JobDetailsCubit.get(context).currentIndex==2
                        ?SvgPicture.asset(AppImages.Blue_mark)
                        :SvgPicture.asset(AppImages.blue_two),

                    (JobDetailsCubit.get(context).currentIndex==2)
                        ?SvgPicture.asset(AppImages.blue_Line)
                        :(JobDetailsCubit.get(context).currentIndex==1
                        || JobDetailsCubit.get(context).currentIndex==0)
                        ? SvgPicture.asset(AppImages.gray_Line)
                        :SvgPicture.asset(AppImages.blue_Line),

                    (JobDetailsCubit.get(context).currentIndex==2 && state is uploadSuccess)
                        ?SvgPicture.asset(AppImages.Blue_mark)
                        :(JobDetailsCubit.get(context).currentIndex==1
                        ||JobDetailsCubit.get(context).currentIndex == 0)
                        ?SvgPicture.asset(AppImages.gray_three)
                        :SvgPicture.asset(AppImages.blue_three),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    SvgPicture.asset(AppImages.Biodata),
                    SizedBox(
                      width: 21.w,
                    ),


                    (JobDetailsCubit.get(context).currentIndex==0)
                        ?SvgPicture.asset(AppImages.Type_of_work_black)
                        :(JobDetailsCubit.get(context).currentIndex==1
                        ||JobDetailsCubit.get(context).currentIndex==2)
                        ?SvgPicture.asset(AppImages.Type_of_work_blue)
                        :SvgPicture.asset(AppImages.Type_of_work_black),


                    SizedBox(
                      width: 16.w,
                    ),
                    (JobDetailsCubit.get(context).currentIndex==0
                    || JobDetailsCubit.get(context).currentIndex==1)
                        ?SvgPicture.asset(AppImages.Upload_portfolio_black)
                        :SvgPicture.asset(AppImages.Upload_portfolio_blue),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 75.h,
              child: PageView(
                physics:NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  JobDetailsCubit.get(context).onPageViewChange(index);
                },
                controller: JobDetailsCubit.get(context).pageViewController,
                children: [
                  BiodataPage(),
                  TypeOfWorkPage(),
                  UploadPortfolioPage(),
                  //SuccessStatePage()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 4.5.h),
              child: MainButton(
                height: 6.h,
                width: 85.w,
                color: AppColors.primrycolor,
                text: (JobDetailsCubit.get(context).currentIndex == 2)
                    ? AppStrings.Submit
                    : AppStrings.next,
                textcolor: AppColors.textcolor,
                onTab: () {
                  if (JobDetailsCubit.get(context)
                      .formKey
                      .currentState!
                      .validate()) {
                    JobDetailsCubit.get(context).name_controller.text;
                    JobDetailsCubit.get(context).email_controller.text;
                    JobDetailsCubit.get(context).phone_controller.text;
                    (state is FieldIsNotEmpty)?
                    JobDetailsCubit.get(context).pageViewController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear):CircularProgressIndicator();
                  }
                  if(JobDetailsCubit.get(context).currentIndex==1&&JobDetailsCubit.get(context).isSelected!=null){
                    JobDetailsCubit.get(context).pageViewController
                        .nextPage(duration: Duration(milliseconds:500),
                        curve: Curves.linear);
                  }
                  if(state is uploadSuccess){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>JopAppliedState()
                        )
                    );

                    // JobDetailsCubit.get(context).pageViewController
                    //     .nextPage(duration: Duration(milliseconds:500),
                    //     curve: Curves.linear);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
