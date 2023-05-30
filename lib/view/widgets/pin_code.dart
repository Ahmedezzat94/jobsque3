import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinCode extends StatelessWidget {

  bool forceErrorState = false;
  void Function(String)? onCompleted;
  void Function(String)? onSubmitted;
  String? Function(String?)? validator;
  TextEditingController? pinController = TextEditingController();


   PinCode({
     Key? key,
     required this.forceErrorState,
     this.validator,
     this.onCompleted,
     this.onSubmitted,
     this.pinController
   }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Pinput(
            length:6,
            onCompleted: onCompleted,
            controller:pinController,
            onSubmitted: onCompleted,
            errorText: "error",
            forceErrorState:false,
            validator:validator

      );


  }
}
