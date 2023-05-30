import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utilities/app_assets.dart';

class CheckEmailLogo extends StatelessWidget {
  const CheckEmailLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SvgPicture.asset(AppImages.emaillogo),
      ),
    );
  }
}
