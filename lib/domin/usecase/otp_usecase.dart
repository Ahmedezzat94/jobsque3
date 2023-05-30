import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utilities/app_const.dart';
import '../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data/data source/auth_remote_data_source/auth_remote_data_source.dart';
import '../../data/repository/auth/auth_repoimpl.dart';
import '../entities/auth/otp_entity.dart';
import '../repository/auth/auth_repo.dart';


class OtpUseCase implements Usecase<OtpEntity,OtpParams>{
  AuthRepo authRepo = AuthRepoImpl(
      AuthRemoteDataSourceImpl( baseUrl: AppConst.baseUrl),
      AuthLocalDataSourceImpl2(),
      NetworkInfoImpl(DataConnectionChecker())
  );


  @override
  Future<Either<Failure, OtpEntity>> call(OtpParams params)async{
   return await authRepo.getOtp(
       email: params.name,
       token: params.token
   );
  }
}

class OtpParams {
  String name;
  String token;

  OtpParams(this.name,this.token);
}