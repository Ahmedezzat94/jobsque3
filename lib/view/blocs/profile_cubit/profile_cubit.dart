import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../../domin/usecase/profile_usecase.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  AuthLocalDataSourceImpl2 authLocalDataSourceImpl2 =AuthLocalDataSourceImpl2();

  getProfile(context) async{
   await ProfileUseCase().call(
       ProfileParams(
        id: await authLocalDataSourceImpl2.getId,
        token: await authLocalDataSourceImpl2.getToken
         )
        ).then((value) {
          return value.bimap(
           (error) {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: Text(error.message))
             );
             emit(ProfileFailed());
           },
           (success) {
             success.data;
             emit(ProfileSuccess());
             print(success.data);
           }
   );
        });
   emit(ProfileInitial());
  }
}
// AuthLocalDataSourceImpl2 authLocalDataSourceImpl2 = AuthLocalDataSourceImpl2();
// void main (context)async{
//   await authLocalDataSourceImpl2.getId.then((value) => print(value));
//
// }