import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/pick_job_cubit/pickjob_cubit.dart';
import '../../pages/pick_job_pages/account_set_up_page.dart';
import '../../pages/pick_job_pages/pick_country_page.dart';
import '../../pages/pick_job_pages/pick_job_page.dart';
import '../../widgets/main_button.dart';

class PickJobScreen extends StatefulWidget {
  const PickJobScreen({Key? key}) : super(key: key);

  @override
  State<PickJobScreen> createState() => _PickJobScreenState();
}

class _PickJobScreenState extends State<PickJobScreen> {

  // PageController pageview_controller = PageController();
  // int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickjobCubit,PickjobState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
          Scaffold(
        backgroundColor: AppColors.textcolor,
        body: SafeArea(
          child: Stack(children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged:(index){
                PickjobCubit.get(context).OnChangePage(index);
              },
              controller: PickjobCubit.get(context).pageview_controller,
              children: [
                PickJobPage(),
                PickCountryPage(),
                AccountSetUpPage()
              ],
            ),
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  MainButton(
                    height: 6.h,
                    width: 90.w,
                    text: (PickjobCubit.get(context).currentindex == 2)
                        ? AppStrings.getstarted
                        : AppStrings.next,
                    fontWeight: FontWeight.w400,
                    textcolor: AppColors.textcolor,
                    color: AppColors.primrycolor,
                    onTab: () {

                      PickjobCubit.get(context).onTap(context);
                      // PickjobCubit.get(context).pageview_controller.nextPage(
                      //   duration: Duration(milliseconds: 500),
                      //   curve: Curves.linear,
                      // );
                      // if (PickjobCubit.get(context).currentindex == 2) {
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => RegisterScreen()));
                      //}
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
