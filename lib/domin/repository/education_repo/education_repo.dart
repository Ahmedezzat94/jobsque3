import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../entities/education/add_education_entity.dart';
import '../../entities/education/show_education_entity.dart';

abstract class EducationRepo {

  Future<Either<Failure,ShowEducationEntity>> getAllEducation();

  Future<Either<Failure,AddEducationEntity>> addEducation({
    required String universty,
    required String title,
    required String start,

    required String end,

  });

}