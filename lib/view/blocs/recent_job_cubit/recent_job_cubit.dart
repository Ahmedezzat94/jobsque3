import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domin/entities/recent_job/recent_job_entity.dart';
import '../../../domin/usecase/get_recentJob_usecase.dart';

part 'recent_job_state.dart';

class RecentJobCubit extends Cubit<RecentJobState> {
  RecentJobCubit() : super(RecentInitial());

  static RecentJobCubit get(context) => BlocProvider.of(context);


  Future<List<RecentJob>?> getRecentJob(context) async {
    emit(GetRecentJobIsLoading());
    //print("G-R-J Is Loading");
    await GetRecentJobUseCase()
        .call(RecentJobParams())
        .then((value) => value.bimap((error) {
              emit(GetRecentJobFailed());
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(error.message)));
            }, (success) {
              if (success.status == true) {
                emit(GetRecentJobSuccess(success.data));
                //print(success.data);
                return success.data;
              } else {
                emit(GetRecentJobFailed());
                //print("G-R-J- Failed");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Server error, no data, please try again")));
              }
            }));
  }
}
