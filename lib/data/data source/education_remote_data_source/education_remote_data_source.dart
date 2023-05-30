import 'package:dio/dio.dart';
import '../../../core/utilities/app_const.dart';
import '../../models/education_model/add_education_model.dart';
import '../../models/education_model/show_education_model.dart';

abstract class EducationRemoteDataSource {

  Future<AddEducationModel> addEducation({
    required String universty,
    required String title,
    required String start,
    required String end,
    required int userId,
    required String token,
  });

  Future<ShowEducationModel> showEducation({
    required int userId,
    required String token,
  });

}

class EducationRemoteDataSourceImpl implements EducationRemoteDataSource {
   Dio client = Dio();
   String baseUrl = AppConst.baseUrl;
  EducationRemoteDataSourceImpl({required this.client,required this.baseUrl});
  @override
  Future<AddEducationModel> addEducation({
    required String universty,
    required String title,
    required String start,
    required String end,
    required int userId,
    required String token}) async {

    Map<String,dynamic> data = {
      "universty":universty,
      "title":title,
      "start":start,
      "end":end,
      "id":userId,
    };

    client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await client.post(
      baseUrl+AppConst.addEducationEndPoint,//
      queryParameters: data,
      options: Options(
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
    return AddEducationModel.fromJson(response.data);
  }

  @override
  Future<ShowEducationModel> showEducation({required int userId, required String token}) async {

    client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await client.get(
      baseUrl+AppConst.showEducationEndPoint(userId),///
      options: Options(
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
    return ShowEducationModel.fromJson(response.data);
  }

}