import 'package:flutter/material.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/app_strings.dart';


class AccesibilityPage extends StatelessWidget {
  const AccesibilityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.textcolor,
      appBar:AppBar(
        backgroundColor:AppColors.textcolor,
      leading:IconButton(
        onPressed: () { Navigator.pop(context); },
        icon: Icon(Icons.arrow_back,color: AppColors.blackcolor,),),
        title:Text(AppStrings.Accesibility,style:TextStyle(
          color:AppColors.blackcolor
        ),),
        elevation:0,
      ),
      body:Center(
        child: Text("Accesibility"),
      ),
    );
  }
}
