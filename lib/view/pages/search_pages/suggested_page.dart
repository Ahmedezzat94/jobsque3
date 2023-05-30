import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../blocs/home_suggestions_screen/home_suggestion_cubit.dart';
import '../../components/suggesion_section.dart';


class SuggestedPage extends StatelessWidget {
  const SuggestedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSuggestionCubit, HomeSuggestionState>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          if (state is HomeSuggestionSuccess) {
            if(HomeSuggestionSuccess.searchJobs!.isEmpty){
              return Column(
                children: [
                  SizedBox(height:10.h,),
                   Text("There is no suggestions",
                     style: TextStyle(fontSize:16.sp,fontWeight:FontWeight.w500),),
                  SizedBox(height:3.h,),
                  SvgPicture.asset(AppImages.close_circle,height:15.h,)
                ],
              );
            }else{
              return Column(
                children: [
                  SuggestionSection(
                    isRecent: false, jobs: HomeSuggestionSuccess.searchJobs!,
                  ),
                ],
              );
            }
          } else if(state is HomeSuggestionLoading){
            return CircularProgressIndicator();

          }else if(state is HomeSuggestionError){
            return Text("there was unknown error");
          }
          else{
            return Text("enter a job you desire");
          }
        });
  }
}
