import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utilities/app_assets.dart';

class PasswordChangedLogo extends StatelessWidget {
  const PasswordChangedLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SvgPicture.asset(AppImages.pass_success),
      ),
    );
  }
}
