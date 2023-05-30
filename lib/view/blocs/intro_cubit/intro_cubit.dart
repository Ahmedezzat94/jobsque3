import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());

  static IntroCubit get(context) => BlocProvider.of(context);


  int currentindex = 0;
  PageController pageview_controller = PageController();

  OnPagechanege(index){
  currentindex = index;
  emit(IntroIncrement());
  }
}
