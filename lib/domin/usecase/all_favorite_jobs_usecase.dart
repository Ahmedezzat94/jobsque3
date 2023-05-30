import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utilities/app_const.dart';
import '../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data/data source/jobs_local_data_source/jobs_local_data_source.dart';
import '../../data/data source/jobs_remote_data_source/jobs_remote_data_source.dart';
import '../../data/repository/jops_repoipml/jobs_repoimpl.dart';
import '../entities/all_favorite_entity/all_favorite_entity.dart';
import '../repository/jobs_repo/jobs_repo.dart';


class AllFavoriteJobsUseCase implements Usecase<AllFavoriteEntity,AllFavoriteJobParams> {
  JobsRepo jobsRepo = JobsRepoImpl(
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      jobsRemoteDataSource: JobsRemoteDataSourceImpl(client: Dio(), baseUrl: AppConst.baseUrl),
      jobsLocalDataSource: JobsLocalDataSourceImpl(),
      authLocalDataSourceImplv2: AuthLocalDataSourceImpl2()
  );
  @override
  Future<Either<Failure, AllFavoriteEntity>> call(AllFavoriteJobParams params)async{
   return await jobsRepo.getAllFavoriteJobs(
       user_id: params.user_id
   );
  }
}

class AllFavoriteJobParams {
  String user_id;
  AllFavoriteJobParams(this.user_id);
}