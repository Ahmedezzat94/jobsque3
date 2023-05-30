import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';


import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utilities/app_const.dart';
import '../../data/data source/apply_remote_data_source/apply_remote_data_source.dart';
import '../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data/repository/apply_repoIml/apply_repoimpl.dart';
import '../entities/apply_entity/apply_entity.dart';
import '../repository/apply_repo/apply_repo.dart';


class ApplyJobUseCase implements Usecase<ApplyEntity,ApplyJobParams>{
  ApplyRepo applyRepo = ApplyRepoImpl(
      AuthLocalDataSourceImpl2(),
      ApplyRemoteDataSourceImpl(client: Dio(), baseUrl: AppConst.baseUrl),
      NetworkInfoImpl(DataConnectionChecker())
  );
  @override
  Future<Either<Failure, ApplyEntity>> call(ApplyJobParams params)async{
    return await applyRepo.applyJob(
        cv_file: params.cv_file,
        name: params.name,
        email: params.email,
        mobile: params.mobile,
        work_type: params.work_type,
        other_file: params.other_file,
        job_id: params.job_id
    );
  }
}

class ApplyJobParams {
   String cv_file;
   String name;
   String email;
   String mobile;
   String work_type;
   String other_file;
   int job_id;

   ApplyJobParams(
       this.cv_file,
       this.name,
       this.email,
       this.mobile,
       this.work_type,
       this.other_file,
       this.job_id
       );
}