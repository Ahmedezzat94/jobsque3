import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../entities/apply_entity/apply_entity.dart';

abstract class ApplyRepo{
  Future<Either<Failure,ApplyEntity>> applyJob({
    required String cv_file,
    required String name,
    required String email,
    required String mobile,
    required String work_type,
    required String other_file,

    required int job_id,
  });
}