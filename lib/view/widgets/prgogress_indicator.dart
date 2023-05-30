import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressIndicatorTool extends StatelessWidget {
   int totalSteps;
   int currentStep;
   double stepSize;
   Color? selectedColor;
   Color? unselectedColor;
   double padding;
   double? width;
   double? height;
   double? selectedStepSize;
   bool Function(int, bool)? roundedCap;
   Widget? child;

   ProgressIndicatorTool({
     Key? key,
     required this.totalSteps,
     required this.currentStep,
     required this.stepSize,
     required this.selectedColor,
     required this.unselectedColor,
     required this.padding,
     required this.height,
     required this.width,
     required this.selectedStepSize,
     required this.roundedCap,
     required this.child
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularStepProgressIndicator(
      totalSteps: totalSteps,
      currentStep: currentStep,
      stepSize: stepSize,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      padding: padding,
      width: width,
      height: height,
      selectedStepSize: selectedStepSize,
      roundedCap: roundedCap,
      child:child ,
    );
  }
}


//reference to know how to use it.
// totalSteps: 100,
// currentStep: 75,
// stepSize: 10,
// selectedColor: AppColors.primrycolor,
// unselectedColor: Colors.grey[200],
// padding: 0,
// width: 150,
// height: 150,
// selectedStepSize: 10,
// roundedCap: (_, __) => true,