import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/utilities/app_colors.dart';
import '../../core/utilities/app_strings.dart';
import '../blocs/pick_job_cubit/pickjob_cubit.dart';
import '../widgets/custome_text.dart';

class CountryFieldCard extends StatefulWidget {
  // bool isSelected = false;
  // String text;
  // IconData? icon;
  CountryField countryField;
  CountryFieldCard({
    Key? key,
    required this.countryField
  }) : super(key: key);

  @override
  State<CountryFieldCard> createState() => _CountryFieldCardState();
}

class _CountryFieldCardState extends State<CountryFieldCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
          widget.countryField.isSelected = !widget.countryField.isSelected;
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(8.0),
          duration: Duration(milliseconds:300),
        decoration:BoxDecoration(
          border:Border.all(color:(widget.countryField.isSelected==true)?AppColors.primrycolor:AppColors.spikcolor,width:1.5),
          borderRadius:BorderRadius.circular(30),
          color: (widget.countryField.isSelected==true)?AppColors.primrycolor.withOpacity(0.2):AppColors.textcolor,
        ),
        child:Row(
          mainAxisSize:MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.countryField.image),
              SizedBox(width:2.w,),
              Text(widget.countryField.countryName,style:TextStyle(fontSize:20),),
            ],
          ),

      ),
    );
  }
}
