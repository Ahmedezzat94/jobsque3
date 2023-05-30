import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utilities/app_const.dart';
import '../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data/data source/education_local_data_source/education_local_data_source.dart';
import '../../data/data source/education_remote_data_source/education_remote_data_source.dart';
import '../../data/repository/education_repoiml/education_repoimpl.dart';
import '../entities/education/show_education_entity.dart';
import '../repository/education_repo/education_repo.dart';


class AllEducationUseCase implements Usecase<ShowEducationEntity,AllEducationParams>{
  EducationRepo educationRepo = EducationRepoImpl(
      educationRemoteDataSource: EducationRemoteDataSourceImpl(client: Dio(), baseUrl: AppConst.baseUrl),
      educationLocalDataSource: EducationLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
      authLocalDataSource: AuthLocalDataSourceImpl2()
  );
  @override
  Future<Either<Failure, ShowEducationEntity>> call(AllEducationParams params)async{
   return await educationRepo.getAllEducation();
  }
}

class AllEducationParams {
}