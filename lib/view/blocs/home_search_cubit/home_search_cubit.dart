import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../domin/entities/recent_job/recent_job_entity.dart';
import '../../../domin/usecase/searchJob_usecase.dart';
import '../../screens/home_screens/home_search_screen.dart';
import '../../screens/home_screens/home_suggest_screen.dart';
part 'home_search_state.dart';

class HomeSearchCubit extends Cubit<HomeSearchState> {

  HomeSearchCubit() : super(HomeSearchInitial());

  static HomeSearchCubit get(context) => BlocProvider.of(context);

  var search_text_controller = TextEditingController();

  onSearchBarTap(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeSuggestScreen()));
    emit(HomeSearchInitial());
  }



  // onSearchBarSubmit(context) {
  //   if (search_text_controller.text.trim().isNotEmpty)
  //     emit(HomeSearchGetResult(HomeSearchGetResult.searchJobs));
  // }




   search(context)async{
    emit(HomeSearchLoading());
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeSearchScreen()));
    if(search_text_controller.text.trim().isNotEmpty) {
      await GetSearchJobUseCase().call(SearchJobParams(
      search: search_text_controller.text
  )).then((value) => value.bimap(
          (error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(
                SnackBar(
                content: Text(error.message)
                )
            );
            emit(HomeSearchError());
          },
          (success) {

            if(success.status == true){
              emit(HomeSearchGetResult(success.data));
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

}
