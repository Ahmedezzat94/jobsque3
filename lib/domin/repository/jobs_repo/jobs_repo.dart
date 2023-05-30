import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../entities/add_favorite_entity/add_favorite_entity.dart';
import '../../entities/all_favorite_entity/all_favorite_entity.dart';
import '../../entities/filter_entity/filter_entity.dart';
import '../../entities/recent_job/recent_job_entity.dart';
import '../../entities/search/search_entity.dart';
import '../../entities/suggested_job/suggested_job_entity.dart';

abstract class JobsRepo {


  Future<Either<Failure,RecentJobEntity>> getRecentJobs();

  Future<Either<Failure,SuggestedJobEntity>> getSuggestedJobs();

  Future<Either<Failure,SearchEntity>> getSearchJobs({required String search});

  Future<Either<Failure,FilterEntity>> getFilterJobs({
        required String search,
        required String location,
        required String salary
  });

  Future<Either<Failure,AddFavoriteEntity>> addFavoriteJobs({
        required String user_id,
        required String job_id
  });

  Future<Either<Failure,AllFavoriteEntity>> getAllFavoriteJobs({
        required String user_id,
  });

}