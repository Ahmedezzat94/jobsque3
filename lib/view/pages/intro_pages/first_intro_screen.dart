import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../components/intro_page_texts/text_intro_page_1.dart';
import '../../screens/auth_screens/register_screen.dart';
import '../../widgets/custome_texbutton.dart';


class FirstIntroScreen extends StatelessWidget {
  const FirstIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Stack(
              children: [
                Image.asset(AppImages.backgroundim1),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppImages.logo,
                        height: 2.h,
                      ),
                      CustomTextButton(
                        text: "Skip",
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                        },
                        color: AppColors.spikcolor,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            TextIntroPage1(),
            SizedBox(
              height: 11.h,
            ),
          ],
        );


  }
}
