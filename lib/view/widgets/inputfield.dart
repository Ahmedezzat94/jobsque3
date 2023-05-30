import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utilities/app_colors.dart';
import '../blocs/auth/login/login_cubit.dart';

class InputField extends StatefulWidget {
  String? label;
  String? hint;
  Color? bordersidecolor;
  IconData? icon;
  Widget? preIcon;
  bool issecure;
  Function validation;
  Function? onChange;
  TextEditingController? controller;
  TextInputType? keyboard;
  int? maxLength;
  int? maxLines;
  InputField(
      {this.label,
      this.hint,
      required this.validation,
        this.onChange,
      this.controller,
      this.maxLength,
      this.bordersidecolor = const Color(0xFF000000),
      this.maxLines = 1,
      this.preIcon,
      this.keyboard = TextInputType.text,
      this.icon,
      this.issecure = false});
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // var eye_icon = Icons.visibility;
  // var hide_password = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (BuildContext context, state) => TextFormField(
          validator: (v) => widget.validation(v),
          onChanged:(v)=> widget.onChange! (v) ,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          controller: widget.controller,
          keyboardType: widget.keyboard,
          obscureText: widget.issecure && LoginCubit.get(context).hide_password,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primrycolor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: widget.bordersidecolor = AppColors.primrycolor)),
              labelText: widget.label,
              alignLabelWithHint: true,
              labelStyle: TextStyle(fontSize: 20, color: AppColors.spikcolor),
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontSize: 15,
              ),
              prefixIcon: widget.preIcon,
              suffixIcon: (widget.issecure)
                  ? IconButton(
                      onPressed: LoginCubit.get(context).togglepass,
                      icon: Icon(
                        LoginCubit.get(context).eye_icon,
                        color: AppColors.blackcolor,
                      ))
                  : null
              //prefixIcon:  Icon(widget.icon),
              ),
        ),
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
  // togglepass(){
  //   hide_password = !hide_password;
  //   eye_icon = hide_password ? Icons.visibility_off : Icons.visibility;
  //   setState(() {
  //
  //   });
  // }
}
