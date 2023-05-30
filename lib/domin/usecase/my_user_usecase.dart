import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utilities/app_const.dart';
import '../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data/data source/auth_remote_data_source/auth_remote_data_source.dart';
import '../../data/repository/auth/auth_repoimpl.dart';
import '../entities/auth/my_user_entity.dart';
import '../repository/auth/auth_repo.dart';


class GetMyUserUseCase implements Usecase<MyUserEntity,GetMyUserParams> {
  AuthRepo authRepo = AuthRepoImpl(
      AuthRemoteDataSourceImpl(baseUrl: AppConst.baseUrl),
      AuthLocalDataSourceImpl2(),
      NetworkInfoImpl(DataConnectionChecker())
  );

  @override
  Future<Either<Failure, MyUserEntity>> call(GetMyUserParams params)async{
    return await authRepo.getMyUser(
        id: params.id,
        token: params.token
    );
  }


}

class GetMyUserParams {
  int id;
  String token;

  GetMyUserParams(this.id,this.token);
}