import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';

class JobTimeChip extends StatelessWidget {
  String jobtimetype;
  String jobtype;
  String joblevel;

  JobTimeChip({Key? key,
    required this.jobtimetype,
    required this.jobtype,
    required this.joblevel
  }) : super(key: key);

  get index => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:60.0,right:60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: 4.h,
            width: 20.w,
            decoration: BoxDecoration(
              color: (index == 0)
                  ? Colors.white.withOpacity(0.14)
                  : Colors.blueAccent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              jobtimetype,
              style: TextStyle(
                  color: (index == 0)
                      ? AppColors.textcolor
                      : AppColors.primrycolor),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 4.h,
            width: 20.w,
            decoration: BoxDecoration(
              color: (index == 0)
                  ? Colors.white.withOpacity(0.14)
                  : Colors.blueAccent.withOpacity(0.14),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              jobtype,
              style: TextStyle(
                  color: (index == 0)
                      ? AppColors.textcolor
                      : AppColors.primrycolor),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 4.h,
            width: 20.w,
            decoration: BoxDecoration(
              color: (index == 0)
                  ? Colors.white.withOpacity(0.14)
                  : Colors.blueAccent.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              joblevel,
              style: TextStyle(
                  color: (index == 0)
                      ? AppColors.textcolor
                      : AppColors.primrycolor),
            ),
          ),
        ],
      ),
    );
  }
}
