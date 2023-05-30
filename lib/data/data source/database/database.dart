import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../../../domin/entities/all_favorite_entity/all_favorite_entity.dart';
import '../../../domin/entities/education/add_education_entity.dart';
import '../../../domin/entities/recent_job/recent_job_entity.dart';
import '../../../domin/entities/suggested_job/suggested_job_entity.dart';
import 'dao/all_favorite_job_dao.dart';
import 'dao/educationdao.dart';
import 'dao/recent_job_dao.dart';
import 'dao/suggested_job_dao.dart';
part 'database.g.dart';
 // the generated code will be there

@Database(version: 1, entities: [RecentJob,SuggestedJob,AllFavoriteJob,Education])
abstract class AppDatabase extends FloorDatabase {
  RecentJobDao get recentJobDao;
  SuggestedJobDao get suggestedJobDao;
  AllFavoriteJobDao get allFavoriteJob;
  EducationDao get educationDao;
}