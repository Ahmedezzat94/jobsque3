import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';

import '../../core/utilities/app_colors.dart';
import '../blocs/job_details_cubit/job_details_cubit.dart';




class NumberInputField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
   Function validation;
   NumberInputField({Key? key,required this.validation,this.controller}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<JobDetailsCubit,JobDetailsState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) =>
          Stack(
            children: [
              Container(
                height:7.h,
                alignment:Alignment.center,
                padding:EdgeInsets.symmetric(horizontal:10),
                decoration:BoxDecoration(
                    border:Border.all(color:AppColors.blackcolor.withOpacity(0.13)),
                    borderRadius:BorderRadius.circular(10)
                ),
                margin:EdgeInsets.only(left:5.w,right: 5.w),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    JobDetailsCubit.get(context).onPhoneFieldChange();
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: PhoneNumber(isoCode: 'NG'),
                  textFieldController: controller,
                  //JobDetailsCubit.get(context).phone_controller,
                  formatInput: true,
                  validator: (v) => validation(v),
                  inputDecoration:InputDecoration(
                    border:InputBorder.none,
                    hintText: "Phone Number"
                  ),
                  keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              Positioned(
                left: 31.w,
                  top: 1.h,
                  child:Container(
                    height: 40,
                    width: 1,
                    color:AppColors.blackcolor.withOpacity(0.13),
                  )
              )
            ],
          ),
    );
}
}
