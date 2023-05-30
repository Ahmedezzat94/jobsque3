import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domin/entities/recent_job/recent_job_entity.dart';
import '../../../domin/usecase/searchJob_usecase.dart';
import '../home_search_cubit/home_search_cubit.dart';

part 'home_suggestion_state.dart';


class HomeSuggestionCubit extends Cubit<HomeSuggestionState> {
  HomeSuggestionCubit() : super(HomeSuggestionInitial());
  static HomeSuggestionCubit get() => HomeSuggestionCubit();

  getSuggestions(context){
    GetSearchJobUseCase().call(SearchJobParams(
        search: HomeSearchCubit.get(context).search_text_controller.text
    )).then((value) => value.bimap(
            (error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
              SnackBar(
                  content: Text(error.message)
              )
          );
          emit(HomeSuggestionError());
        },
            (success) {
          if(success.status == true){
            emit(HomeSuggestionSuccess(success.data));
            print("got results");
          }else{
            ScaffoldMessenger.of(context).
            showSnackBar(
                SnackBar(
                    content: Text("somthing went wrong with searching"))
            );
          }
        })
    );
  }
}
