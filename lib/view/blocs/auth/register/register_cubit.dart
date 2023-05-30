import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../domin/usecase/register_usecase.dart';
import '../../../screens/auth_screens/pick_job_screen.dart';

part 'register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController username_contrller = TextEditingController();
  TextEditingController email_contrller = TextEditingController();
  TextEditingController password_contrller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static RegisterCubit get(context) => BlocProvider.of(context);

  onRegistrationTap(context)async{
    if(formKey.currentState!.validate()){
      emit(RegisterLoading());

      await RegisterUseCase().
      call(RegisterParams(
        name: username_contrller.text,
        email: email_contrller.text,
        password: password_contrller.text,
      )
      ).then((value) =>
          value.bimap(
                  (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content:Text(error.message))
                    );
                    emit(RegisterFailed());
                  },
                  (success) {
                    if(success.status == true){
                      emit(RegisterSuccess());

                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => PickJobScreen() ));
                      ScaffoldMessenger.of(context).
                      showSnackBar(SnackBar(
                        content: Text(
                          "signed up success",
                          style: TextStyle(fontSize: 12.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        elevation: 10,
                        dismissDirection: DismissDirection.endToStart,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppColors.secondrycolor,
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height - 170,
                        ),
                      ));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          elevation: 10,
                          backgroundColor: Colors.red,
                          dismissDirection: DismissDirection.horizontal,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height - 170,
                          ),
                          content: Text("Cheack your email or oassword")));
                      emit(RegisterFailed());
                    }
                  }
                  )
      );
    }
  }
}
