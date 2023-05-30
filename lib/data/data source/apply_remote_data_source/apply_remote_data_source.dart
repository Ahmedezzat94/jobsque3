import 'package:dio/dio.dart';
import '../../../core/utilities/app_const.dart';
import '../../models/apply_model/apply_model.dart';

abstract class ApplyRemoteDataSource{
  Future<ApplyJobModel> applyJob({
    required String token,
    required String cv_file,
    required String name,
    required String email,
    required String mobile,
    required String work_type,
    required String other_file,

    required int job_id,
    required int user_id,
  });
}

class ApplyRemoteDataSourceImpl implements ApplyRemoteDataSource{

  Dio client;
  String baseUrl;
  ApplyRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl
  });

  @override
  Future<ApplyJobModel> applyJob({
    required String token,
    required String cv_file,
    required String name,
    required String email,
    required String mobile,
    required String work_type,
    required String other_file,
    required int job_id,
    required int user_id
  })async{
    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    Map<String,dynamic> data = {
      "user_id" : user_id ,
      "job_id" : job_id ,
      "cv_file" : cv_file,
      "name" : name,
      "email" : email,
      "mobile" : mobile,
      "work_type" : work_type,
      "other_file" : other_file,
    };
    Response response = await client.post(baseUrl+AppConst.applyEndPoint,
      data: data,
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
    return ApplyJobModel.fromJson(response.data);
  }
}