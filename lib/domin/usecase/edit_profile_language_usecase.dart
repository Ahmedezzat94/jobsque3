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
import '../entities/profile/edit_profile_language_endtity.dart';
import '../repository/profile_repo/profile_repo.dart';


class EditProfileLanguageUseCase implements Usecase<EditProfileLanguageEntity,EditProfileLanguageParams> {
  ProfileRepo profileRepo = ProfileRepoImpl(
    profileRemoteDataSource: ProfileRemoteDataSourceimpl(client: Dio(), baseUrl: AppConst.baseUrl),
    authLocalDataSource: AuthLocalDataSourceImpl2(),
    //profileLocalDataSource: ProfileLocalDataSourceImpl(),
    networkInfo: NetworkInfoImpl(DataConnectionChecker()),

  );
  @override
  Future<Either<Failure, EditProfileLanguageEntity>> call(EditProfileLanguageParams params)async{
    return await profileRepo.editProfileLanguage(language: params.langauge);
  }
}

class EditProfileLanguageParams {
  String langauge;
  EditProfileLanguageParams(this.langauge);
}