import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/home_search_cubit/home_search_cubit.dart';
import '../../components/home_page_components/head_section.dart';
import '../../components/home_page_components/home_page_header.dart';
import '../../components/home_page_components/recent_job_field.dart';
import '../../components/home_page_components/search_bar.dart';
import '../../components/home_page_components/suggested_job_field.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:BlocConsumer<HomeSearchCubit,HomeSearchState>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state)=>
            Column(
            children: [
               HomePageHeader(),
              SizedBox(height:3.h,),
              Padding(
                padding:EdgeInsets.only(left:15.0,right:15,bottom:10),
                child: SearchBar(
                  //controller:HomeSearchCubit.get(context).search_text_controller,
                  onTap:(){HomeSearchCubit.get(context).onSearchBarTap(context);}
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left:15,right:15,bottom:10),
                child: HeadSection(
                  LeftText:AppStrings.Suggested_Job,
                  fontsize_lefttext:16.sp,
                  fontWeight_lefttext:FontWeight.w600,
                  RightText:AppStrings.View_all,
                  onTap: (){}
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left:10.0),
                child: SuggestedJobField(),
              ),
              Padding(
                padding:const EdgeInsets.only(left:15,right:15,bottom:10),
                child: HeadSection(
                  LeftText:AppStrings.RecentJob,
                  fontsize_lefttext: 16.sp,
                  fontWeight_lefttext:FontWeight.w600,
                  RightText:AppStrings.View_all,
                ),
              ),
              Expanded(child: RecentJobField())
            ],
          ),
      ),

    );
  }
}
