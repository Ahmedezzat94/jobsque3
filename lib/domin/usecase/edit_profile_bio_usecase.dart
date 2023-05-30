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
import '../entities/profile/edit_profile_bio_mobile_address.dart';
import '../repository/profile_repo/profile_repo.dart';


class EditProfileBioUseCase implements Usecase<EditProfileBioMobileAddressEntity,EditProfileBioParams> {
  ProfileRepo profileRepo = ProfileRepoImpl(
  profileRemoteDataSource: ProfileRemoteDataSourceimpl(client: Dio(), baseUrl: AppConst.baseUrl),
  authLocalDataSource: AuthLocalDataSourceImpl2(),
  //profileLocalDataSource: ProfileLocalDataSourceImpl(),
  networkInfo: NetworkInfoImpl(DataConnectionChecker())
  );

  @override
  Future<Either<Failure, EditProfileBioMobileAddressEntity>> call(params)async{
    return await profileRepo.editProfileBioAddressMobile(
    bio: params.bio,
    address: params.address,
    mobile: params.mobile
  );
  }
}

class EditProfileBioParams {
  String bio;
  String address;
  String mobile;

  EditProfileBioParams(this.bio,this.address,this.mobile);
}