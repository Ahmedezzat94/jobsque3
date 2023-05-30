import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utilities/app_const.dart';
import '../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data/data source/profile_local_data_source/profile_local_data_source.dart';
import '../../data/data source/profile_remot_data_source/profile_remote_data_source.dart';
import '../../data/repository/profile_repoimpl/profile_repoimpl.dart';
import '../entities/profile/update_profile_entity.dart';
import '../repository/profile_repo/profile_repo.dart';


class UpdateProfileUseCase implements Usecase<UpdateProfileEntity,UpdateProfileParams> {
  ProfileRepo profileRepo = ProfileRepoImpl(
      profileRemoteDataSource: ProfileRemoteDataSourceimpl(client: Dio(), baseUrl: AppConst.baseUrl),
    authLocalDataSource: AuthLocalDataSourceImpl2(),
    //profileLocalDataSource: ProfileLocalDataSourceImpl(),
    networkInfo: NetworkInfoImpl(DataConnectionChecker()),

  );
  @override
  Future<Either<Failure, UpdateProfileEntity>> call(UpdateProfileParams params)async{
    return await profileRepo.updateProfile(
      intersted_work:params.intrested_work,
      offline_place:params.offline_place,
      remote_place:params.remote_place
    );
  }
}

class UpdateProfileParams {
  String intrested_work;
  String offline_place;
  String remote_place;

  UpdateProfileParams(
      this.intrested_work,
      this.offline_place,
      this.remote_place
      );

}