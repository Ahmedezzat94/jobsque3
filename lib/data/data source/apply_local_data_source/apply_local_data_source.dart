import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../core/utilities/app_const.dart';
import '../../../domin/entities/apply_entity/apply_entity.dart';

abstract class ApplyLocalDataSource{
  Future<void> applyJob(ApplyJob applyJob)async{
    Future<ApplyJob?> getapplyJob;
  }
}


class ApplyLocalDataSourceImpl extends ApplyLocalDataSource{
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

  Future<void> saveApplyJobInfo(ApplyJob? applyJob) async {
    _instance.put(AppConst.applyKey,applyJob);
  }
}