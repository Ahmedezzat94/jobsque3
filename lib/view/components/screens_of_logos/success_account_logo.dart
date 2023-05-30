import 'package:flutter/cupertino.dart';

import '../../../core/utilities/app_assets.dart';


class SuccessAcountLogo extends StatelessWidget {
  const SuccessAcountLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset(AppImages.successaccount),
      ),
    );
  }
}
