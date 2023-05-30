import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domin/entities/suggested_job/suggested_job_entity.dart';
import '../../../domin/usecase/get_suggestedJob_usecase.dart';

part 'suggested_job_state.dart';

class SuggestedJobCubit extends Cubit<SuggestedJobState> {
  SuggestedJobCubit() : super(SuggestedJobInitial());

  static SuggestedJobCubit get(context) => BlocProvider.of(context);

  Future<void> getSuggestedJob(context) async {
    emit(GetSuggestedJobIsLoading());
    //print("is Loading");
    await GetSuggestedJobUseCase()
        .call(SuggestedJobParams())
        .then((value) => value.bimap((error) {
              emit(GetSuggestedJobFailed());
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(error.message)));
              return;
            }, (success) {
              if (success.status == true) {
                emit(GetSuggestedJobSuccess(success.data));
               // print("is success");
                return ;
              } else {
                emit(GetSuggestedJobFailed());
                //print("is Failed");
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Data not found")));
                return;
              }
            }));
  }
}
