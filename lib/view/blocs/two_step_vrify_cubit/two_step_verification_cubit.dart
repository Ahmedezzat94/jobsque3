import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'two_step_verification_state.dart';


class TwoStepVerificationCubit extends Cubit<TwoStepVerificationState> {
  TwoStepVerificationCubit() : super(TwoStepVerificationInitial());

  static TwoStepVerificationCubit get(context)=>BlocProvider.of(context);
  bool twoStepVerificationIsSelected = false;

  onSwitchTap(value){
    twoStepVerificationIsSelected = value;
    if(value==true){
      emit(TwoStepVerificationTrue());
    }else{
      emit(TwoStepVerificationFalse());
    }

  }


}

