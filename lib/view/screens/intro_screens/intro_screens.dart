import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/intro_cubit/intro_cubit.dart';
import '../../pages/intro_pages/first_intro_screen.dart';
import '../../pages/intro_pages/sec_intro_screen.dart';
import '../../pages/intro_pages/third_intro_screen.dart';
import '../../widgets/main_button.dart';
import '../auth_screens/register_screen.dart';



class IntroScreens extends StatefulWidget{
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IntroCubit,IntroState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
          Scaffold(
        body:SafeArea(
          child: Stack(
            children: [
              PageView(
                onPageChanged:(index){
                  IntroCubit.get(context).OnPagechanege(index);
                },
                controller:IntroCubit.get(context).pageview_controller,
                children: const [
                   FirstIntroScreen(),
                   SecIntroScreen(),
                   ThirdIntroScreen(),
          ],),

              //SmoothPageIndicator
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height:5.h,
                        width:10.w,
                        alignment:Alignment(0,0.68),
                        child:SmoothPageIndicator(
                          effect:SlideEffect(
                            radius:10.0,
                            activeDotColor:AppColors.primrycolor,
                            dotColor:AppColors.dotcolor,
                            dotHeight:1.h,
                            dotWidth: 2.2.w,
                            spacing:3.6
                          ),
                            controller: IntroCubit.get(context).pageview_controller, count: 3
                        )),
                    SizedBox(height: 4.h,),
                MainButton(
                    height: 6.h,
                    width: 90.w,
                    text:  (IntroCubit.get(context).currentindex == 2)?AppStrings.getstarted:AppStrings.next,
                    fontWeight:FontWeight.w400,
                    textcolor: AppColors.textcolor,
                    color: AppColors.primrycolor,
                    onTab: () {
                      IntroCubit.get(context).pageview_controller.nextPage(duration:Duration(milliseconds:500),
                          curve: Curves.linear,
                      );
                      if(IntroCubit.get(context).currentindex == 2 ){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>RegisterScreen()));
                      }
                    },
                  ),
                    SizedBox(height: 2.h,)
                  ],
                ),
              )
            ],),
        ),
      ),
    );
  }
}