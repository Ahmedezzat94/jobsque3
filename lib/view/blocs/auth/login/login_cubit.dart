import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utilities/app_colors.dart';
import '../../../../domin/usecase/login_usecase.dart';
import '../../../screens/home_screens/home_screen.dart';
part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController username_contrller = TextEditingController();
  TextEditingController password_contrller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  var eye_icon = Icons.visibility;
  var hide_password = true;

  onLoginButtonTap(context) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());

      await LoginUseCase()
          .call(LoginParams(
              email: username_contrller.text.trim(),
              password: password_contrller.text.trim()))
          .then((value) {
        value.bimap((error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(
              content: Text(error.message)
          ));
          emit(LoginFailed());

        }, (success) {
          if (success.status == true) {
            emit(LoginSuccess());


            Navigator.pushReplacement(
                context, MaterialPageRoute(
                builder: (context) => HomeScreen()
            ));

            ScaffoldMessenger.of(context).
            showSnackBar(SnackBar(
              content: Text(
                "Login success",
                style: TextStyle(fontSize: 12.sp,
                    fontWeight: FontWeight.w500
                ),
              ),
              elevation: 10,
              dismissDirection: DismissDirection.endToStart,
              behavior: SnackBarBehavior.floating,
              backgroundColor: AppColors.primrycolor,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 170,
              ),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                elevation: 10,
                backgroundColor: Colors.red,
                dismissDirection: DismissDirection.horizontal,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height - 170,
                ),
                content: Text("Cheack your email or Password")));
            emit(LoginFailed());

          }
        });
      });
    }
    // emit(LoginInitial());
  }

  togglepass() {
    hide_password = !hide_password;
    eye_icon = hide_password ? Icons.visibility_off : Icons.visibility;
    emit(LoginInitial());
  }
}
// if (formKey.currentState!.validate()) {
// LoginCubit.get(context).username_contrller!.text;
// LoginCubit.get(context).password_contrller!.text;
// await LoginUseCase().call(LoginParams(
// email: LoginCubit.get(context).username_contrller!.text.trim(),
// password: LoginCubit.get(context).password_contrller.text.trim()
// )).then((value) {
// ScaffoldMessenger.of(context)
//     .showSnackBar(SnackBar(
// content: Text("login successfully"),
// duration:Duration(seconds:2) ,)
// );
// return value
//     .bimap(
// (l) => l.message,
// (r) => print(r.status));
// });
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) => HomeScreen()));
// }
