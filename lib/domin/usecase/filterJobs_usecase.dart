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
import '../entities/filter_entity/filter_entity.dart';
import '../repository/jobs_repo/jobs_repo.dart';


class FilterUseCase implements Usecase<FilterEntity,FilterJobParams> {
  JobsRepo jobsRepo = JobsRepoImpl(
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      jobsRemoteDataSource: JobsRemoteDataSourceImpl(client: Dio(), baseUrl: AppConst.baseUrl),
      jobsLocalDataSource: JobsLocalDataSourceImpl(),
      authLocalDataSourceImplv2: AuthLocalDataSourceImpl2()
  );
  @override
  Future<Either<Failure, FilterEntity>> call(FilterJobParams params)async{
    return await jobsRepo.getFilterJobs(
        search: params.search,
        location: params.location,
        salary: params.salary
    );
  }
}

class FilterJobParams {
  String search;
  String location;
  String salary;
  FilterJobParams(this.search,this.location,this.salary);
}