import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecase/usecase.dart';
import '../../core/utilities/app_const.dart';
import '../../data/data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data/data source/auth_remote_data_source/auth_remote_data_source.dart';
import '../../data/repository/auth/auth_repoimpl.dart';
import '../entities/auth/profile_entity.dart';
import '../repository/auth/auth_repo.dart';


class ProfileUseCase implements Usecase<ProfileEntity,ProfileParams> {
  AuthRepo authRepo = AuthRepoImpl(
      AuthRemoteDataSourceImpl(baseUrl: AppConst.baseUrl),
      AuthLocalDataSourceImpl2(),
      NetworkInfoImpl(DataConnectionChecker())
  );

  @override
  Future<Either<Failure, ProfileEntity>> call(ProfileParams params)async{
    return await authRepo .getProfile(
        id: params.id,
        token: params.token
    );
  }
}

class ProfileParams {
  int id;
  String token;

  ProfileParams({required this.id, required this.token});
}
