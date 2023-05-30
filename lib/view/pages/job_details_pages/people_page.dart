import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../components/job_details_components/employe_job_fields.dart';
import '../../components/job_details_components/people_section.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:2.h,),
        EmployeJobFields(),
        SizedBox(height:3.h,),
        PeopleSection()
      ],
    );
  }
}
