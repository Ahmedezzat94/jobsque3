import 'package:dio/dio.dart';
import '../../../core/utilities/app_const.dart';
import '../../models/auth/login_model.dart';
import '../../models/auth/my_user_model.dart';
import '../../models/auth/otp_model.dart';
import '../../models/auth/profile_model.dart';
import '../../models/auth/registration_model.dart';

abstract class AuthRemoteDataSource{

  Future<RegistrationModel>register({
      required String name,
      required String email,
      required String password
});

  Future<LoginModel>login({
      required String email,
      required String password
  });

  Future<OtpModel> getOtp ({
    required String email,
    required String token
  });

  Future<ProfileModel> getProfile({
    required int id,
    required String token
  });

  Future<MyUserModel> getMyUser({
    required int id,
    required String token
  });

}



class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  Dio client = Dio();
  String baseUrl;
  AuthRemoteDataSourceImpl({required this.baseUrl});

  @override
  Future<LoginModel>login({
        required String email,
        required String password
   })async{
    Map<String,dynamic> loginData ={
      "email": email,
      "password" : password
    };
    Response response = await client.post(
      baseUrl+AppConst.loginEndPoint,
      data: loginData,
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
    return LoginModel.fromJson(response.data);
  }


  @override
  Future<RegistrationModel>register({
    required String name,
    required String email,
    required String password
  })async{
   Map<String,dynamic> data = {
     "name":name,
     "email":email,
     "password":password
   };
   Response response = await client.post(baseUrl+AppConst.registerEndPoin,data:data);
   return RegistrationModel.fromJson(response.data);
  }
  Future<OtpModel>getOtp({
  required String email,
    required String token
   })async{
    client.options.headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await client.get(baseUrl+AppConst.otpEndPoint(email));
   return OtpModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> getProfile({
    required int id,
    required String token
  })async{
    client.options.headers = {
      'Authorization': 'Bearer $token'
  };
    Response response = await client.get(baseUrl+AppConst.tokenEndPoint(id),
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
    return ProfileModel.fromJson(response.data);
 }

 Future<MyUserModel> getMyUser({
  required int id,
   required String token
  })async{
   client.options.headers = {
     'Authorization': 'Bearer $token'
   };
   Response response = await client.put(baseUrl+AppConst.updateEndPoint(id),options:Options(
     receiveDataWhenStatusError: true,
     followRedirects: false,
     validateStatus: (status)=> true,
     headers: {
       'Content-Type': 'application/json',
       'Accept': 'application/json',
     },
     receiveTimeout: const Duration(seconds: 60),
   ),);
   return MyUserModel.fromJson(response.data);
 }


}

// void main()async{
//   // runApp(appUi());
//  AuthRemoteDataSourceImpl remoteDataSourceImpl =
//  AuthRemoteDataSourceImpl(client:Dio(),baseUrl:AppConst.baseUrl);
//   await remoteDataSourceImpl.getMyUser(
//       //name:"AhmedEzzat14",
//       //email: "AhmedEzzat14@gmail.com",
//       token: "790|4blUiF0AlF0ncOez5Nn4rS9Hkwv2pviXPaHvspIq",
//       id: 178
//   ).then((value) => print(value.data!.email));
  // AuthRepoImpl authRepoImpl = AuthRepoImpl(
  //     RemotDataSourceImpl(client: Dio(), baseUrl:AppConst.baseUrl),
  //     LocalDataSourceImpl(await SharedPreferences.getInstance()),
  //     NetworkInfoImpl(DataConnectionChecker())
  // );
  //  authRepoImpl.login(
  //      email: "AhmedEzzat14@gmail.com",
  //      password: "AhmedEzzat14"
  //  ).then((value) => (value.bimap((l) => l.message, (r) => r.user)));
// }


