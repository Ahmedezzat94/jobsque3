import 'package:dartz/dartz.dart';
import '../../../core/error/exeption.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../../domin/entities/profile/edit_profile_bio_mobile_address.dart';
import '../../../domin/entities/profile/edit_profile_language_endtity.dart';
import '../../../domin/entities/profile/update_profile_entity.dart';
import '../../../domin/repository/profile_repo/profile_repo.dart';
import '../../data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data source/profile_local_data_source/profile_local_data_source.dart';
import '../../data source/profile_remot_data_source/profile_remote_data_source.dart';

class ProfileRepoImpl implements ProfileRepo{

  ProfileRemoteDataSource profileRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  //ProfileLocalDataSource profileLocalDataSource;
  NetworkInfo networkInfo;

  ProfileRepoImpl({
    required this.profileRemoteDataSource,
    required this.authLocalDataSource,
    //required this.profileLocalDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, UpdateProfileEntity>> updateProfile({
    String? intersted_work = "",
    String? offline_place = "",
    String? remote_place = ""
  })async{
    if(await networkInfo.isConnected){
      try{
        int? id = await authLocalDataSource.getId;
        String? token = await authLocalDataSource.getToken;
        if (id == null || token == null) return left(CacheFailure("there was unknown error"));



        UpdateProfileEntity entity = await profileRemoteDataSource.updateProfile(
          id: id,
          token: token,
          intersted_work: "",
          offline_place: "",
          remote_place: "" ,
        );

        //profileLocalDataSource.setProfile(entity.data);
        return right(entity);
      }on ServerException {
        return left(
            ServerFailure("There was a server error, please try again later!"));
      }
    }
      return Left(NetworkFailure("something went with you connection pleas check your network"));
  }

  @override
  Future<Either<Failure, EditProfileBioMobileAddressEntity>> editProfileBioAddressMobile({
    required String? bio,
    required String? address,
    required String? mobile
  })async{
   if( await networkInfo.isConnected){
     try{
         int? id = await authLocalDataSource.getId;
         String? token = await authLocalDataSource.getToken;
         if (id == null || token == null) return left(CacheFailure("there was unknown error"));

         // profileLocalDataSource.getProfile.then(
         //         (value) {
         //       if(bio == "") bio = value?.bio;
         //       if(mobile == "") mobile = value?.mobile;
         //       if(address == "") address = value?.address;
         //     }
         // );

         EditProfileBioMobileAddressEntity entity = await profileRemoteDataSource.editProfileBioAddressMobile(
             id: id,
             token: token,
             bio: "",
             address: "",
             mobile: ""
         );
         return right(entity);
       }on ServerException {
       return left(
           ServerFailure("There was a server error, please try again later!"));
     }
   }
   return Left(NetworkFailure("something went with you connection pleas check your network"));
  }

  @override
  Future<Either<Failure, EditProfileLanguageEntity>> editProfileLanguage({
    required String? language
  })async{
    if(await networkInfo.isConnected){
      try{
        int? id = await authLocalDataSource.getId;
        String? token = await authLocalDataSource.getToken;
        if (id == null || token == null) return left(CacheFailure("there was unknown error"));

        // profileLocalDataSource.getProfile.then(
        //         (value) {
        //       if(language == "") language = value?.language;
        //     }
        // );

        EditProfileLanguageEntity entity = await profileRemoteDataSource.editProfileLanguage(
            id: id,
            token: token,
            language: ""
        );

      }on ServerException {
        return left(
            ServerFailure("There was a server error, please try again later!"));
      }
    }
    return Left(NetworkFailure("something went with you connection pleas check your network"));
  }




}