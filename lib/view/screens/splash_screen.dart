import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../core/utilities/app_assets.dart';
import '../blocs/core_cubit/core_cubit.dart';
import 'intro_screens/intro_screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   // HomeSearchCubit.get(context).search(context);
    context.read<CoreCubit>().appInit();
    NavigatetoIntro();
    super.initState();
  }

  NavigatetoIntro() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => IntroScreens()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(child: Image.asset(AppImages.circle4)),
            Center(child: Image.asset(AppImages.circle3)),
            Center(child: Image.asset(AppImages.circle2)),
            Center(child: Image.asset(AppImages.circle1)),
            Center(
                child: SvgPicture.asset(
              AppImages.logo,
              height: 3.h,
            )),
          ],
        ),
      ),
    );
  }
}
