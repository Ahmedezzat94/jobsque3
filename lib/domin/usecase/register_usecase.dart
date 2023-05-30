import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utilities/app_const.dart';
import '../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data/data source/auth_remote_data_source/auth_remote_data_source.dart';
import '../../data/repository/auth/auth_repoimpl.dart';
import '../entities/auth/registration_entity.dart';
import '../repository/auth/auth_repo.dart';


class RegisterUseCase implements Usecase<RegistrationEntity,RegisterParams>{
  AuthRepo authRepo = AuthRepoImpl(
      AuthRemoteDataSourceImpl( baseUrl: AppConst.baseUrl),
      AuthLocalDataSourceImpl2(),
      NetworkInfoImpl(DataConnectionChecker())
  );
  RegisterUseCase();
  @override
  Future<Either<Failure, RegistrationEntity>> call(RegisterParams params)async{
    return await authRepo.registration(
        name: params.name,
        email: params.email,
        password: params.password
    );
  }

}

class RegisterParams {
  String name;
  String email;
  String password;
 RegisterParams({required this.name,required this.email,required this.password});
}