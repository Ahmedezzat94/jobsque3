import 'package:dartz/dartz.dart';
import '../../../core/error/exeption.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/network_info.dart';
import '../../../domin/entities/add_favorite_entity/add_favorite_entity.dart';
import '../../../domin/entities/all_favorite_entity/all_favorite_entity.dart';
import '../../../domin/entities/filter_entity/filter_entity.dart';
import '../../../domin/entities/recent_job/recent_job_entity.dart';
import '../../../domin/entities/search/search_entity.dart';
import '../../../domin/entities/suggested_job/suggested_job_entity.dart';
import '../../../domin/repository/jobs_repo/jobs_repo.dart';
import '../../data source/auth_local_data_source/auth_local_data_source.dart';
import '../../data source/jobs_local_data_source/jobs_local_data_source.dart';
import '../../data source/jobs_remote_data_source/jobs_remote_data_source.dart';


class JobsRepoImpl implements JobsRepo {

  AuthLocalDataSourceImpl2 authLocalDataSourceImplv2;
  JobsLocalDataSource jobsLocalDataSource;
  JobsRemoteDataSource jobsRemoteDataSource;
  NetworkInfo networkInfo;

  JobsRepoImpl(
      {
        required this.networkInfo,
      required this.jobsRemoteDataSource,
      required this.jobsLocalDataSource,
      required this.authLocalDataSourceImplv2});

  @override
  Future<Either<Failure, RecentJobEntity>> getRecentJobs() async {
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSourceImplv2.getToken;

        if(token == null) return left(CacheFailure("there was unknown error"));

        RecentJobEntity entity = await jobsRemoteDataSource.getRecentJobs(token: token);

        jobsLocalDataSource.clearRecentJobs();
        jobsLocalDataSource.setRecentJobs(entity.data);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }else{
      RecentJobEntity? entity = await jobsLocalDataSource.getRecentJobs();
      if(entity == null || entity.data == null || entity.data!.isEmpty) return left(NetworkFailure("Please check your internet connection"));
      return right(entity);

    }
  }

  @override
  Future<Either<Failure, SuggestedJobEntity>> getSuggestedJobs() async {
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSourceImplv2.getToken;
        int? id = await authLocalDataSourceImplv2.getId;

        if(token == null || id == null) return left(CacheFailure("there was unknown error"));

        SuggestedJobEntity entity = await jobsRemoteDataSource.getSuggestedJobs(token: token, id: id);

         jobsLocalDataSource.clearSuggestedJob();
         jobsLocalDataSource.setSuggestedJob(entity.data);
         //jobsLocalDataSource.getSuggestedJob().then((value) => print("${value.data}<<<<>>>>>>>>"));

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }else{
      SuggestedJobEntity? entity = await jobsLocalDataSource.getSuggestedJob();
      if(entity == null || entity.data == null || entity.data!.isEmpty)
        return left(NetworkFailure("Please check your internet connection"));
        return right(entity);
    }
  }

  @override
  Future<Either<Failure, SearchEntity>> getSearchJobs({required String search}) async {
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSourceImplv2.getToken;

        if(token == null) return left(CacheFailure("there was unknown error"));

        SearchEntity entity = await jobsRemoteDataSource.getSearchJobs(
            token: token,
            search: search
        );
        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, FilterEntity>> getFilterJobs({
    required String search,
    required String location,
    required String salary
  })async{
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSourceImplv2.getToken;

        if(token == null) return left(CacheFailure("there was unknown error"));
        FilterEntity entity = await jobsRemoteDataSource.getFilterJobs(
            token: token,
            search: search,
            location: location,
            salary: salary
        );
        return right(entity);
      }on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, AllFavoriteEntity>> getAllFavoriteJobs({
    required String user_id,
  })async{
   if(await networkInfo.isConnected){
     try{
       String? token = await authLocalDataSourceImplv2.getToken;
       if(token == null) return left(CacheFailure("there was unknown error"));
       AllFavoriteEntity entity = await jobsRemoteDataSource.getAllFavoriteJobs(
           token: token,
           user_id: user_id
       );
       return right(entity);
     }on ServerException {
       return left(ServerFailure("There was a server error, please try again later!"));
     }
   }
   return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, AddFavoriteEntity>> addFavoriteJobs({
    required String user_id,
    required String job_id
  })async{
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSourceImplv2.getToken;
        if(token == null) return left(CacheFailure("there was unknown error"));
        AddFavoriteEntity entity = await jobsRemoteDataSource.addFavoriteJobs(
            token: token,
            user_id: user_id,
            job_id: job_id
        );
        return right(entity);
      }on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

}