import 'package:dartz/dartz.dart';
import '../../../core/error/exeption.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../../domin/entities/apply_entity/apply_entity.dart';
import '../../../domin/repository/apply_repo/apply_repo.dart';
import '../../data source/apply_remote_data_source/apply_remote_data_source.dart';
import '../../data source/auth_local_data_source/auth_local_data_source.dart';

class ApplyRepoImpl implements ApplyRepo{

        AuthLocalDataSourceImpl2 authLocalDataSourceImplv2;
        ApplyRemoteDataSource applyRemoteDataSource;
        NetworkInfo networkInfo;

  ApplyRepoImpl (
      this.authLocalDataSourceImplv2,
      this.applyRemoteDataSource,
      this.networkInfo
      );

  @override
  Future<Either<Failure, ApplyEntity>> applyJob({
    required String cv_file,
    required String name,
    required String email,
    required String mobile,
    required String work_type,
    required String other_file,
    required int job_id
  })async{
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSourceImplv2.getToken;
        int? id = await authLocalDataSourceImplv2.getId;
        if(token == null || id == null)
          return left(CacheFailure("there was unknown error"));
        ApplyEntity entity = await applyRemoteDataSource.applyJob(
            token: token,
            cv_file: cv_file,
            name: name,
            email: email,
            mobile: mobile,
            work_type: work_type,
            other_file: other_file,
            job_id: job_id,
            user_id: id
        );
        return right(entity);
      }on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }
}