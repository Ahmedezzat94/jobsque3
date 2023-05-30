import 'package:dio/dio.dart';
import '../../../core/utilities/app_const.dart';
import '../../models/profile/edit_profile_bio_mobile_address_model.dart';
import '../../models/profile/edit_profile_language_model.dart';
import '../../models/profile/update_profile_model.dart';

abstract class ProfileRemoteDataSource{
  Future<UpdateProfileModel> updateProfile({
    required int id,
    required String token,
    String intersted_work,
    String offline_place,
    String remote_place
  });

  Future<EditProfileBioMobileAddressModel> editProfileBioAddressMobile({
    required int id,
    required String token,
    required String bio,
    required String address,
    required String mobile
  });

  Future<EditProfileLanguageModel> editProfileLanguage({
    required int id,
    required String token,
    required String language,
  });

}

class ProfileRemoteDataSourceimpl implements ProfileRemoteDataSource{
  @override
  Dio client;
  String baseUrl;
  ProfileRemoteDataSourceimpl({required this.client,required this.baseUrl});


  Future<UpdateProfileModel> updateProfile({
    required int id,
    required String token,
    String intersted_work = "",
    String offline_place = "",
    String remote_place = ""
  })async{
    Map<String,dynamic> data = {
      "intersted_work": intersted_work,
      "offline_place": offline_place,
      "remote_place": remote_place,
    };
    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    Response response = await client.put(baseUrl+AppConst.updateEndPoint(id),
      queryParameters:data ,
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
    return UpdateProfileModel.fromJson(response.data);
  }

  @override
  Future<EditProfileBioMobileAddressModel> editProfileBioAddressMobile({
    required int id,
    required String token,
    required String bio,
    required String address,
    required String mobile
  })async{
    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    Map<String,dynamic> data = {
      "bio": bio,
      "address": address,
      "mobile": mobile,
    };
    Response response = await client.put(baseUrl+AppConst.editProfileBioMobileAddress,
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
      ),);
    return EditProfileBioMobileAddressModel.fromJson(response.data);
  }

  @override
  Future<EditProfileLanguageModel> editProfileLanguage({
    required int id,
    required String token,
    required String language
  })async{

    client.options.headers = {
      'Authorization': 'Bearer $token'
    };
    
    Map<String,dynamic> data = {
      "language": language,
    };

    Response response = await client.put(baseUrl+AppConst.editProfileLanguageEndPoint,
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
    return EditProfileLanguageModel.fromJson(response.data);
  }







}