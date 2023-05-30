import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_strings.dart';
import '../../blocs/complete_profile_cubit/complete_profile_cubit.dart';
import '../../components/complete_profile_components/education_card.dart';
import '../../components/complete_profile_components/experience_card.dart';
import '../../components/complete_profile_components/pesonal_details_card.dart';
import '../../components/complete_profile_components/portofolio_card.dart';
import '../../pages/comlete_profile_pages/education_page.dart';
import '../../pages/comlete_profile_pages/experience_page.dart';
import '../../pages/comlete_profile_pages/personal_details.dart';
import '../../pages/profile_pages/general/portofolio.dart';
import '../../widgets/prgogress_indicator.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  // late List<GDPData> _chartData;
  // late TooltipBehavior _tooltipBehavior;
  @override

  // void initState() {
  //   _chartData = getChartData () ;
  //   _tooltipBehavior = TooltipBehavior(enable:true);
  //   super. initState();
  // }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit,CompleteProfileState>(
      listener: (BuildContext context, Object? state) {
      print("step 1 is${CompleteProfileCubit.get(context).step1}");
      print("step 2 is${CompleteProfileCubit.get(context).step2}");
      print("step 3 is${CompleteProfileCubit.get(context).step3}");
      print("step 4 is${CompleteProfileCubit.get(context).step4}");

      },
      builder: (BuildContext context, state) =>
          Scaffold(
        backgroundColor:AppColors.textcolor,
        appBar: AppBar(
          backgroundColor:AppColors.textcolor,
          leading:IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: Icon(Icons.arrow_back,color:AppColors.blackcolor,),
          ),
          title:Text(AppStrings.Complete_Profile,style:TextStyle(
            color:AppColors.blackcolor
          ),),
        elevation: 0,
        ),
        body:Column(
          children: [
            Center(
              child: ProgressIndicatorTool(
                totalSteps: 100,
                currentStep:CompleteProfileCubit.get(context).currentStep*25,
                stepSize: 2.w,
                selectedColor: AppColors.primrycolor,
                unselectedColor: AppColors.nutral300,
                padding: 0,
                height: 35.w,
                width: 35.w,
                selectedStepSize: 2.5.w
                , roundedCap: (int , bool ) =>true,
                child: Center(
                  child:Text("${CompleteProfileCubit.get(context).currentStep*25}%",style:TextStyle(
                      color:AppColors.primrycolor,
                      fontSize:25.sp,
                      fontWeight:FontWeight.w500
                  ),),
                ),
              ),
            ),
            SizedBox(height:2.h,),
                Text(AppStrings.completed(CompleteProfileCubit.get(context).currentStep),style:TextStyle(
                color:AppColors.primrycolor,
                fontSize:15.sp,
                fontWeight:FontWeight.w500
            ),),

            SizedBox(height:1.h,),
            Text(AppStrings.complet_you_profile_befor_applyieng,
            style:TextStyle(
              color:AppColors.nutralcolor,
              fontSize:12.sp
            ),
            ),
            SizedBox(height: 2.h,),
            PesonalDetailsCard(
              isSelected: CompleteProfileCubit.get(context).personalDetailsisSelected=false,
              onTap: (){
             Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>PersonalDetails())
             );
              },
            ),
            SizedBox(height:2.h,),
            EducationCard(isSelected: CompleteProfileCubit.get(context).educationisSelected=false,
              onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>EducationPage())
              );
              },),
            SizedBox(height:2.h,),
            ExperienceCard(
              isSelected:CompleteProfileCubit.get(context).expereienceIsSelected=false,
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ExperiencePage())
                );
              },),
            SizedBox(height:2.h,),
            PortofolioCard(
              isSelected: CompleteProfileCubit.get(context).portofolioIsSelected,
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Portofolio())
                );
              },),
          ],
        ),
      ),
    );
  }


}
// SfCircularChart(
// tooltipBehavior: _tooltipBehavior,
// borderWidth:1.w,
// //borderColor: AppColors.primrycolor,
// series: <CircularSeries>[
// RadialBarSeries<GDPData, String>(
// trackBorderColor: AppColors.primrycolor,
// innerRadius:"95",
// dataSource: _chartData,
// xValueMapper: (GDPData data, _) => data. continent,
// yValueMapper: (GDPData data, _) => data. gdp,
// enableTooltip: true,
// dataLabelSettings:DataLabelSettings(isVisible:true))
// ],
// )
// List<GDPData> getChartData() {
//   final List<GDPData> chartData = [
//     GDPData('percntage', 100),
//     // GDPData('Africa', 2490),
//     // GDPData('S America', 2900),
//     // GDPData('Europe', 23050),
//     // GDPData( 'N America', 24880),
//     // GDPData('Asia', 34390),
//   ];
//   return chartData;
// }
//  class GDPData {
//   GDPData(this .continent, this.gdp) ;
//   final String continent;
//   final int gdp;
// }
