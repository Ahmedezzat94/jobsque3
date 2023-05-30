import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import 'search_result_field.dart';

class RecentSearchJobs extends StatelessWidget {
  const RecentSearchJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height:70.h,
        child:SearchResultJobsField()
    );
  }
}
