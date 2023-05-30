import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../entities/profile/edit_profile_bio_mobile_address.dart';
import '../../entities/profile/edit_profile_language_endtity.dart';
import '../../entities/profile/update_profile_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure,UpdateProfileEntity>> updateProfile({
     String? intersted_work,
     String? offline_place,
     String? remote_place
  });


  Future<Either<Failure,EditProfileBioMobileAddressEntity>> editProfileBioAddressMobile({
  required String? bio,
  required String? address,
  required String? mobile
  });

  Future<Either<Failure,EditProfileLanguageEntity>> editProfileLanguage({
    required String? language,
  });

}