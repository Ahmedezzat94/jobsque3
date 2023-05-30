import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque2/view/blocs/home_suggestions_screen/home_suggestion_cubit.dart';
import 'package:sizer/sizer.dart';

import 'view/blocs/auth/login/login_cubit.dart';
import 'view/blocs/auth/register/register_cubit.dart';
import 'view/blocs/complete_profile_cubit/complete_profile_cubit.dart';
import 'view/blocs/core_cubit/core_cubit.dart';
import 'view/blocs/home_screen_cubit/main_layout_cubit.dart';
import 'view/blocs/home_search_cubit/home_search_cubit.dart';
import 'view/blocs/intro_cubit/intro_cubit.dart';
import 'view/blocs/job_details_cubit/job_details_cubit.dart';
import 'view/blocs/pick_job_cubit/pickjob_cubit.dart';
import 'view/blocs/profile_cubit/profile_cubit.dart';
import 'view/blocs/recent_job_cubit/recent_job_cubit.dart';
import 'view/blocs/suggested_job_cubit/suggested_job_cubit.dart';
import 'view/blocs/two_step_vrify_cubit/two_step_verification_cubit.dart';
import 'view/screens/splash_screen.dart';

void main() {
  runApp(JOBSQUE());
}


class JOBSQUE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(create: (context)=>HomeSuggestionCubit()),
                BlocProvider(create: (context)=>RecentJobCubit()),
                BlocProvider(create: (context)=>SuggestedJobCubit()),
                BlocProvider(create: (context)=>ProfileCubit()),
                BlocProvider(create: (context)=>CoreCubit()),
                BlocProvider(create: (context)=>IntroCubit()),
                BlocProvider(create: (context)=>RegisterCubit()),
                BlocProvider(create: (context)=>LoginCubit()),
                BlocProvider(create: (context)=>MainLayOutCubit()),
                BlocProvider(create: (context)=>HomeSearchCubit()),
                BlocProvider(create: (context)=>JobDetailsCubit()),
                BlocProvider(create: (context)=>PickjobCubit()),
                BlocProvider(create: (context)=>TwoStepVerificationCubit()),
                BlocProvider(create: (context)=>CompleteProfileCubit()),
              ],

              child: MaterialApp(
                home: SplashScreen(),
                debugShowCheckedModeBanner: false,
              ),
            ));
  }
}
