import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_colors.dart';

class PeopleSection extends StatelessWidget {
  const PeopleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:40.h,
      child:ListView.separated(
        itemCount:7,
        itemBuilder: (BuildContext context, int index) =>
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width:4.w,),
                    Column(
                      children: [
                        Padding(
                          padding:EdgeInsets.only(right:20.0.w),
                          child: Text("Ahmed Ezzat",style:TextStyle(
                              color:AppColors.blackcolor,fontWeight:FontWeight.w400,fontSize:12.sp
                          ),),
                        ),
                        SizedBox(height:1.h,),
                        Text("senior btngan f el ay habal",style:TextStyle(
                            color:AppColors.nutralcolor
                        ),)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Work during",style:TextStyle(color:AppColors.nutral400),),
                        SizedBox(height:1.h,),
                        Padding(
                          padding:EdgeInsets.only(left:8.0.w),
                          child: Text("5 Years",style:TextStyle(color:AppColors.primrycolor),),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ), separatorBuilder: (BuildContext context, int index) => Divider(color:AppColors.nutral400,height:4.h,),
      ),
    );
  }
}
