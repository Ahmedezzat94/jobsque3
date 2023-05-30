import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';

class PicIntroPage3 extends StatelessWidget {
  const PicIntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50.h,
      width:double.infinity,
      child: Image.asset(AppImages.backgroundimg3),
    );
  }
}