import '../../../core/utilities/app_const.dart';
import '../../../domin/entities/all_favorite_entity/all_favorite_entity.dart';
import '../../../domin/entities/recent_job/recent_job_entity.dart';
import '../../../domin/entities/suggested_job/suggested_job_entity.dart';
import '../../models/all_favorite_model/all_favorite_model.dart';
import '../../models/recent_job_model/recent_job_model.dart';
import '../../models/suggested_job_model/suggested_job_model.dart';
import '../database/dao/all_favorite_job_dao.dart';
import '../database/dao/recent_job_dao.dart';
import '../database/dao/suggested_job_dao.dart';
import '../database/database.dart';

abstract class JobsLocalDataSource{
  Future<RecentJobModel> getRecentJobs();
  Future<void> clearRecentJobs();
  Future<void> setRecentJobs(List<RecentJob>? job);

  Future<SuggestedJobModel> getSuggestedJob();
  Future<void> clearSuggestedJob();
  Future<void> setSuggestedJob(List<SuggestedJob>? job);

  Future<AllFavoriteModel> getAllFavoriteJob();
  Future<void> clearAllFavoriteJob();
  Future<void> setAllFavoriteJob(List<AllFavoriteJob>? job);

}

class JobsLocalDataSourceImpl implements JobsLocalDataSource{
  //late AppDatabase database;
  JobsLocalDataSourceImpl();

  Future<AppDatabase> initDB() async {
    return await $FloorAppDatabase
        .databaseBuilder(AppConst.sqfliteDB)
        .build();
  }

  // Future<AppDatabase?> initDB()async{
  //   return await $FloorAppDatabase.databaseBuilder(AppConst.sqfliteDB).build();
  // }

  Future<AppDatabase> get database async => await initDB();
//   Future<AppDatabase?> get database async {
//     return await initDB();
// }

  Future<RecentJobDao> get recentJobDao => database.then((value) => value.recentJobDao);
  Future<SuggestedJobDao> get suggestedJobDao => database.then((value) => value.suggestedJobDao);
  Future<AllFavoriteJobDao> get allFavoriteJobDao => database.then((value) => value.allFavoriteJob);


  @override
  Future<void> clearRecentJobs()async{
    //recentJobDao.deleteAllJobs();
    //database.then((value) => value!.recentJobDao.deleteAllJobs());
    recentJobDao.then((value) => value.deleteAllJobs());
  }

  @override
  Future<void> clearSuggestedJob()async{
   //suggestedJobDao.deleteAllJobs();
  await suggestedJobDao.then((value) => value.deleteAllJobs());
  }

  @override
  Future<RecentJobModel> getRecentJobs()async{
    var recentJobs = await recentJobDao.then((value) => value.getAllJobs()); //recentJobDao.getAllJobs();
    RecentJobModel model = RecentJobModel(
     status: true,
      data: recentJobs
    );
    return model;
  }

  @override
  Future<SuggestedJobModel> getSuggestedJob() async {
    var suggestedJobs = await suggestedJobDao.then((value) => value.getAllJobs()); //suggestedJobDao.getAllJobs();
    SuggestedJobModel model = SuggestedJobModel(
        status: true,
        data: suggestedJobs
    );
    return model;
  }

  @override
  Future<void> setRecentJobs(List<RecentJob>? jobs) async {
    for (int i = 0; i < jobs!.length;++i) {
      await recentJobDao.then((value) => value.insertJob(jobs[i])); //recentJobDao. insertJob (jobs[i]);
    }
   }

  @override
  Future<void> setSuggestedJob(List<SuggestedJob>? job)async {
    if(job == null) return ;
    for(int i = 0; i < job.length-1; ++i){
      await suggestedJobDao.then((value) => value.insertJob(job[i])); //suggestedJobDao.insertJob(job[i]);
    }
   }

  @override
  Future<void> clearAllFavoriteJob() async {
 // allFavoriteJobDao.deleteAllFavoriteJob();
  allFavoriteJobDao.then((value) => value.deleteAllFavoriteJob());
  }

  @override
  Future<AllFavoriteModel> getAllFavoriteJob()async {
    var allFavoriteJob = await allFavoriteJobDao.then((value) => value.getAllFavoriteJob()); //allFavoriteJobDao.getAllFavoriteJob();
    AllFavoriteModel model = AllFavoriteModel(
        status: true,
        data: allFavoriteJob
    );
    return model;
  }

  @override
  Future<void> setAllFavoriteJob(List<AllFavoriteJob>? job)async{
    for(int i = 0 ; i <job!.length;++i){
      await allFavoriteJobDao.then((value) => value.insertAllFavoriteJob(job[i])); //allFavoriteJobDao.insertAllFavoriteJob(job[i]);
    }
  }
   
}