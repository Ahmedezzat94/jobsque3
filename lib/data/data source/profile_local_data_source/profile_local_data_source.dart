import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../core/utilities/app_const.dart';
import '../../../domin/entities/auth/registration_entity.dart';

abstract class ProfileLocalDataSource{
  Future<void> setProfile(Profile? profile );
  Future<Profile?> get getProfile;
}


class ProfileLocalDataSourceImpl extends ProfileLocalDataSource{
  dbInit() async {
    await Hive.initFlutter();
    var db = Hive.box(AppConst.db);
    if(db.isOpen == false){
      Box db = await Hive.openBox(AppConst.db);
    }
  }

  Box get _instance {
    dbInit();
    return Hive.box(AppConst.db);
  }
  @override
  Future<void> setProfile(Profile? profile) async {
    _instance.put(AppConst.profileKey,profile);
  }

  @override
 
  Future<Profile?> get getProfile => _instance.get(AppConst.profileKey);
  
}