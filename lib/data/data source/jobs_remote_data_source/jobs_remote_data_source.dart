import 'package:dio/dio.dart';
import '../../../core/utilities/app_const.dart';
import '../../models/add_favorite_model/add_favorite_model.dart';
import '../../models/all_favorite_model/all_favorite_model.dart';
import '../../models/filter_model/filter_model.dart';
import '../../models/recent_job_model/recent_job_model.dart';
import '../../models/search_model/search_model.dart';
import '../../models/suggested_job_model/suggested_job_model.dart';

abstract class JobsRemoteDataSource{
  Future<RecentJobModel> getRecentJobs({
      required String token,
  });

  Future<SuggestedJobModel> getSuggestedJobs({
      required String token,
      required int id
  });

  Future<SearchModel> getSearchJobs({
      required String token,
      required String search
  });

  Future<FilterModel> getFilterJobs({
      required String token,
      required String search,
      required String location,
      required String salary
  });

  Future<AddFavoriteModel> addFavoriteJobs({
      required String token,
      required String user_id,
      required String job_id,
  });

  Future<AllFavoriteModel> getAllFavoriteJobs({
      required String token,
      required String user_id,
  });

}

class JobsRemoteDataSourceImpl implements JobsRemoteDataSource{
  
  Dio client;
  String baseUrl;
  JobsRemoteDataSourceImpl({required this.client,required this.baseUrl});
  
  @override
  Future<RecentJobModel> getRecentJobs({
    required String token})
    async{
      client.options.headers = {
        'Authorization': 'Bearer $token'
      };

      Response response = await client.get(baseUrl+AppConst.recenJobEndPoint,
        options:Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status)=> true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        receiveTimeout: const Duration(seconds: 60),
      ),);
      return RecentJobModel.fromJson(response.data);
  }

  @override
  Future<SuggestedJobModel> getSuggestedJobs({
    required String token,
    required int id
  })
  async{
    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    Response response = await client.get(baseUrl+AppConst.suggestedJobEndPoint(id),
      options:Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status)=> true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    return SuggestedJobModel.fromJson(response.data);
  }

  @override
  Future<SearchModel> getSearchJobs({
    required String token,
    required String search})async{
    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    Map<String,dynamic> data ={
      "name": search
    };

    Response response = await client.get(baseUrl+AppConst.searchEndpoint,
      queryParameters:data,
      options:Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status)=> true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    return SearchModel.fromJson(response.data);
  }

  @override
  Future<FilterModel> getFilterJobs({
    required String token,
    required String search,
    required String location,
    required String salary})async{
    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    Map<String,dynamic> data ={
      "name" : search,
      "location" : location,
      "salary" : salary
    };
    Response response = await client.get(baseUrl+AppConst.filterEndPoint,
      queryParameters: data,
      options:Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status)=> true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    return FilterModel.fromJson(response.data);
  }

  @override
  Future<AddFavoriteModel> addFavoriteJobs({
    required String token,
    required String user_id,
    required String job_id
  })async{
    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    Map<String,dynamic> data = {
      "user_id" : user_id ,
      "job_id" : job_id ,
    };
    Response response = await client.post(baseUrl+AppConst.favoriteEndPoint,
      queryParameters: data,
      options:Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status)=> true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    return AddFavoriteModel.fromJson(response.data);
  }

  @override
  Future<AllFavoriteModel> getAllFavoriteJobs({
    required String token,
    required String user_id
  })async{
    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    Map<String,dynamic> data = {
      "user_id" : user_id ,
    };
    Response response = await client.get(baseUrl+AppConst.favoriteEndPoint,
      options:Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status)=> true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    return AllFavoriteModel.fromJson(response.data);
  }
  
}

