import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../entities/auth/login_entity.dart';
import '../../entities/auth/my_user_entity.dart';
import '../../entities/auth/otp_entity.dart';
import '../../entities/auth/profile_entity.dart';
import '../../entities/auth/registration_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,LoginEntity>>login({

    required String email,
    required String password
});

 Future<Either<Failure,RegistrationEntity>> registration({
        required String name,
        required String email,
        required String password
   });

  Future<Either<Failure,OtpEntity>>getOtp({
        required String email,
        required String token
  });

  Future<Either<Failure,ProfileEntity>>getProfile({
    required int id,
    required String token
  });

  Future<Either<Failure,MyUserEntity>>getMyUser({
    required int id,
    required String token
  });

 }

