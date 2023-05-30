import 'package:dartz/dartz.dart';

import '../../../core/error/exeption.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../../domin/entities/auth/login_entity.dart';
import '../../../domin/entities/auth/my_user_entity.dart';
import '../../../domin/entities/auth/otp_entity.dart';
import '../../../domin/entities/auth/profile_entity.dart';
import '../../../domin/entities/auth/registration_entity.dart';
import '../../../domin/repository/auth/auth_repo.dart';
import '../../data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data source/auth_remote_data_source/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo{

  AuthRemoteDataSource remoteDataSource;
  AuthLocalDataSource localDataSource;
  NetworkInfo networkInfo;

  AuthRepoImpl(
      this.remoteDataSource,
      this.localDataSource,
      this.networkInfo
      );

  @override
  Future<Either<Failure, RegistrationEntity>> registration ({
    required String name,
    required String email,
    required String password
  })async
  {
    if(await networkInfo.isConnected){
      try{

      RegistrationEntity entity = await remoteDataSource.register(
            name: name,
            email: email,
            password: password
        );
      storage(entity);
      return right(entity);
      } on ServerException{
        return left(ServerFailure("there was an error,please try again later"));
      }
    }else{
      return Left(NetworkFailure("something went with you connection pleas check your network"));
    }
  }
 void storage(RegistrationEntity entity)async{
    localDataSource.setUserName(entity.profile!.name!);
    localDataSource.setEmail(entity.profile!.email!);
    localDataSource.setId(entity.profile!.userId!);
    localDataSource.setOtp(entity.data!.otp!);
    localDataSource.setToken(entity.token!);
 }
  void storage2(LoginEntity entity)async{
    localDataSource.setUserName(entity.user!.name!);
    localDataSource.setEmail(entity.user!.email!);
    localDataSource.setId(entity.user!.id!);
    localDataSource.setOtp(int.parse(entity.user!.otp!));
    localDataSource.setToken(entity.token!);
  }
 
  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password
  })async{
   if(await networkInfo.isConnected){
     try{
       LoginEntity entity = await remoteDataSource.login(
         email: email,
         password: password
           );
       storage2(entity);
       return right(entity);
     } on ServerException{
       return left(ServerFailure("there was an error,please try again later"));
     }
   }else{
     return Left(NetworkFailure("something went with you connection pleas check your network"));
   }
  }

  @override
  Future<Either<Failure, OtpEntity>> getOtp({
    required String email,
    required String token})async{
    if(await networkInfo.isConnected){
      try{
        OtpEntity entity =  await remoteDataSource.getOtp(
            email: email, 
            token: token
        );
        localDataSource.setOtp(int.parse(entity.data!));
        return right(entity);
      }on ServerException{
        return left(ServerFailure("there was an error,please try again later"));
      }
    }else{
      return Left(NetworkFailure("something went with you connection pleas check your network"));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile({
    required int id,
    required String token
  })async{
    if(await networkInfo.isConnected){
      try{
        ProfileEntity entity = await remoteDataSource.getProfile(
            id: id,
            token: token
        );
        localDataSource.setToken(token);
        return right(entity);
      }on ServerException{
        return left(ServerFailure("there was an error,please try again later"));
      }
    }else{
      return Left(NetworkFailure("something went with you connection pleas check your network"));
    }
  }

  @override
  Future<Either<Failure, MyUserEntity>> getMyUser({
    required int id,
    required String token
  })async{
    if(await networkInfo.isConnected){
      try{
        MyUserEntity entity = await remoteDataSource.getMyUser(
            id: id,
            token: token
        );
        localDataSource.setToken(token);
        return right(entity);
      }on ServerException{
        return left(ServerFailure("there was an error,please try again later"));
      }
    }else{
      return Left(NetworkFailure("something went with you connection pleas check your network"));
    }
  }
}