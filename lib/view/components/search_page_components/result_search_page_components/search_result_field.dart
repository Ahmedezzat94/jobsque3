import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_assets.dart';
import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';
import '../../../blocs/home_search_cubit/home_search_cubit.dart';
import '../../../blocs/recent_job_cubit/recent_job_cubit.dart';
class SearchResultJobsField extends StatefulWidget {
  SearchResultJobsField({Key? key}) : super(key: key);

  @override
  State<SearchResultJobsField> createState() => _SearchResultJobsFieldState();
}

class _SearchResultJobsFieldState extends State<SearchResultJobsField> {
  int CurrentIndex = 0;
  @override
  void initState() {
    //HomeSearchCubit.get(context).search(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSearchCubit, HomeSearchState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        if(state is HomeSearchGetResult){
          return ListView.separated(
            itemCount:HomeSearchGetResult.searchJobs!.length,
            separatorBuilder: (context, index) {
              return Divider(
                color: AppColors.nutralcolor,
                endIndent: 4.w,
                indent: 4.w,
              );
            },
            itemBuilder: (context, index) {
              // index = CurrentIndex ;
              return Container(
                height: 14.h,
                color: AppColors.textcolor,
                child: Column(
                  //mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                        onTap: (){
                          // JobDetailsCubit.suggestedJob =
                          // GetSuggestedJobSuccess.suggestedjobs?[index];
                          // JobDetailsCubit.get(context).navigateToJobDetails(
                          //     context,
                          //     GetSuggestedJobSuccess.suggestedjobs![index]);
                        },
                        leading: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: SvgPicture.asset(AppImages.zoom_icon)),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "${HomeSearchGetResult.searchJobs![index].name}",
                            style: TextStyle(
                                color: AppColors.blackcolor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        subtitle: Text("${HomeSearchGetResult.searchJobs![index].compName} . ${HomeSearchGetResult.searchJobs![index].location} ",
                            style: TextStyle(color: AppColors.nutral400)),
                        trailing: InkWell(
                            onTap: () {
                              setState(() {
                                CurrentIndex = index;
                              });
                            },
                            child: SvgPicture.asset(
                              (CurrentIndex == index)
                                  ? AppImages.achive_active
                                  : AppImages.archive_unactive,
                            ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 3.h,
                                width: 18.w,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  "${HomeSearchGetResult.searchJobs![index].jobTimeType}",
                                  style: TextStyle(color: AppColors.primrycolor),
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 3.h,
                                width: 18.w,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  "${HomeSearchGetResult.searchJobs![index].jobType}",
                                  style: TextStyle(color: AppColors.primrycolor),
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 3.h,
                                width: 18.w,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  "${HomeSearchGetResult.searchJobs![index].jobLevel}",
                                  style: TextStyle(color: AppColors.primrycolor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0.w),
                          child: Row(
                            children: [
                              Text(
                                "\$${HomeSearchGetResult.searchJobs![index].salary}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Colors.green),
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
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }else if( state is GetRecentJobFailed){
          return SizedBox();
        }else{
          return Center(child: CircularProgressIndicator(),);
        }

      },
    );
  }
}
