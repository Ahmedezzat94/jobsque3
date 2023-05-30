import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';

import '../../../core/utilities/app_assets.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/home_screen_cubit/main_layout_cubit.dart';
import '../../screens/auth_screens/login_screen.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 22.h,
            width: double.infinity,
            color: AppColors.primari100,
            child:Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left:2.w,
                  bottom:10.h,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        MainLayOutCubit.get(context).OnBackArrowTap();
                      }, icon: Icon(Icons.arrow_back_outlined,color:AppColors.blackcolor,)),
                      SizedBox(width:27.w,),
                      Text(AppStrings.Profile,style:TextStyle(fontSize:16.sp,fontWeight:FontWeight.w600),),
                      SizedBox(width:29.w,),
                      InkWell(
                        onTap:(){
                          showDialog(
                              context: context,
                              builder: (context)=>
                                  AlertDialog(
                                    title: Text("Are you sure you want to logout?"),
                                    content: Row(
                                      mainAxisAlignment:MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed:() {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context)=>LogingScreen()),
                                                    );
                                          },
                                          child: Text("YES"),
                                        ),
                                        TextButton(
                                          onPressed:() {
                                            Navigator.pop(context);
                                          },
                                          child: Text("NO"),
                                        ),
                                      ],
                                    ),
                                  )
                          );
                        },
                          child: SvgPicture.asset(AppImages.Logout_icon))
                    ],
                  ),
                ),
                Positioned(
                  top:15.h,
                  left:35.w,
                  child: Container(
                    height:30.w,
                    width: 30.w,
                    decoration:BoxDecoration(
                        border:Border.all(color:AppColors.textcolor,width:1.w),
                        borderRadius:BorderRadius.all(Radius.circular(20.w))
                    ),
                    child: CircleAvatar(),
                  ),
                )
              ],
            ),
          );
  }
}












