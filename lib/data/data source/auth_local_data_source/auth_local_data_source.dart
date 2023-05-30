import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/utilities/app_const.dart';

abstract class AuthLocalDataSource{
  Future<void> setUserName(String name);
  Future<String?> get getUserName;

  Future<void> setEmail(String email);
  Future<String?> get getEmail;

  Future<void> setOtp( int otp);
  Future<int?> get getOtp;

  Future<void> setId(int id);
  Future<int?> get getId;

  Future<void> setToken(String token);
  Future<String?> get getToken;
}

// class LocalDataSourceImpl implements LocalDataSource{
//   SharedPreferences sharedPreferences;
//   LocalDataSourceImpl(this.sharedPreferences);
//
//   @override
//   Future<String?> get getEmail async =>  sharedPreferences.getString(AppConst.emailKey);
//
//   @override
//   Future<int?> get getId async => sharedPreferences.getInt(AppConst.idKey);
//
//   @override
//   Future<int?> get getOtp async => sharedPreferences.getInt(AppConst.otpKey);
//
//   @override
//   Future<String?> get getToken async => sharedPreferences.getString(AppConst.tokenKey);
//
//   @override
//   Future<String?> get getUserName async => sharedPreferences.getString(AppConst.userNameKey);
//
//   @override
//   Future<void> setEmail(email) async {
//     sharedPreferences.getString(AppConst.emailKey);
//   }
//
//   @override
//   Future<void> setId(id)async {
//     sharedPreferences.getString(AppConst.idKey);
//   }
//
//   @override
//   Future<void> setOtp(otp)async {
//     sharedPreferences.getString(AppConst.otpKey);
//   }
//
//   @override
//   Future<void> setToken(token) async{
//     sharedPreferences.getString(AppConst.tokenKey);
//   }
//
//   @override
//   Future<void> setUserName(name)async{
//     sharedPreferences.getString(AppConst.userNameKey);
//   }
// }

// var box = Hive.box('myBox');
//
// box.put('name', 'David');
//
// var name = box.get('name');
//
// print('Name: $name');

class AuthLocalDataSourceImpl2 implements AuthLocalDataSource{
  AuthLocalDataSourceImpl2();
  Future<Box> get db {
    return dbInit();
  }
  Future<Box> dbInit() async {
    await Hive.initFlutter();
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
     Hive.init(appDocumentDirectory.path);
     
    if(Hive.isBoxOpen(AppConst.db)){  //ask about the name dont forget.....
    return await Hive.openBox(AppConst.db);
    }
    return await Hive.openBox(AppConst.db);
  }



  Future<Box> get instance async{
    return db;
  }
  
  @override
  Future<String?> get getEmail async => await instance.then((value) => value.get(AppConst.emailKey));

  @override
  Future<int> get getId async => await instance.then((value) => value.get(AppConst.idKey));

  @override
  Future<int?> get getOtp async => await instance.then((value) => value.get(AppConst.otpKey));

  @override
  Future<String> get getToken async => await instance.then((value) => value.get(AppConst.tokenKey));

  @override
  Future<String?> get getUserName async => await instance.then((value) => value.get(AppConst.userNameKey));

  @override
  Future<void> setEmail(String? email)async{
   await instance.then((value){
     value.put(AppConst.emailKey, email);
     value.flush();
    }

    );
  }

  @override
  Future<void> setId(int? id)async{
   await instance.then((value){
     value.put(AppConst.idKey, id);
     value.flush();
     }
   );
  }

  @override
  Future<void> setOtp(int? otp)async{
    await instance.then((value){
      value.put(AppConst.otpKey, otp);
      value.flush();
    }
    );
  }

  @override
  Future<void> setToken(String token)async{
   await instance.then((value){
     value.put(AppConst.tokenKey, token);
     value.flush();
   }
   );
  }

  @override
  Future<void> setUserName(String name)async{
    await instance.then((value){
      value.put(AppConst.userNameKey, name);
      value.flush();
    }
    );
  }
  
}