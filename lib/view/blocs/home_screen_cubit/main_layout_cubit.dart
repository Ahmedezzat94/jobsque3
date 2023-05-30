import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'main_layout_state.dart';

class MainLayOutCubit extends Cubit<MainLayOutState> {
  MainLayOutCubit() : super(MainLayOutHome());

  static MainLayOutCubit get(context) => BlocProvider.of(context);


  int CurrentIndex = 0;
  List states = [
    MainLayOutHome(),
    MainLayOutMessages(),
    MainLayOutApplied(),
    MainLayOutSaved(),
    MainLayOutProfile()
  ];

  OnItemTap(click){
    CurrentIndex = click;
    emit(states[click]);
  }

  OnBackArrowTap(){
     CurrentIndex-- ;
    emit(MainLayOutHome());
  }
}
