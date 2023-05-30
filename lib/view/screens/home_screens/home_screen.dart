import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/home_screen_cubit/main_layout_cubit.dart';
import '../../pages/home_screen_pages/applied_page.dart';
import '../../pages/home_screen_pages/home_page.dart';
import '../../pages/home_screen_pages/message_page.dart';
import '../../pages/home_screen_pages/profile_page.dart';
import '../../pages/home_screen_pages/saved_page.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List pages = [
    HomePage(),
    MessagePage(),
    AppliedPage(),
    SavedPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayOutCubit,MainLayOutState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
          Scaffold(
            backgroundColor:AppColors.textcolor,
            body:pages.elementAt(MainLayOutCubit.get(context).CurrentIndex),
            bottomNavigationBar:BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon:(MainLayOutCubit.get(context).CurrentIndex==0)?SvgPicture.asset(AppImages.homea_ctive)
                    :SvgPicture.asset(AppImages.home_unactive),label:AppStrings.Home,),
                BottomNavigationBarItem(icon:(MainLayOutCubit.get(context).CurrentIndex==1)?SvgPicture.asset(AppImages.massege_active)
                    :SvgPicture.asset(AppImages.massege_unactive),label: AppStrings.Messages),
                BottomNavigationBarItem(icon:(MainLayOutCubit.get(context).CurrentIndex==2)?SvgPicture.asset(AppImages.briefcase_active)
                    :SvgPicture.asset(AppImages.briefcase_unactive),label:AppStrings.Applied),
                BottomNavigationBarItem(icon:(MainLayOutCubit.get(context).CurrentIndex==3)?SvgPicture.asset(AppImages.achive_active)
                    :SvgPicture.asset(AppImages.archive_unactive),label: AppStrings.Saved),
                BottomNavigationBarItem(icon:(MainLayOutCubit.get(context).CurrentIndex==4)?SvgPicture.asset(AppImages.profile_active)
                    :SvgPicture.asset(AppImages.profile_unactive),label: AppStrings.Profile),
              ],
              onTap:(click){
                MainLayOutCubit.get(context).OnItemTap(click);
              },
              currentIndex: MainLayOutCubit.get(context).CurrentIndex,
              selectedItemColor:AppColors.primrycolor,
              showUnselectedLabels: true,
              unselectedItemColor:AppColors.nutralcolor,
            ),
          ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//    HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
