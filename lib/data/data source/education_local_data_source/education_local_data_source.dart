import '../../../core/utilities/app_const.dart';
import '../../../domin/entities/education/add_education_entity.dart';
import '../../models/education_model/show_education_model.dart';
import '../database/dao/educationdao.dart';
import '../database/database.dart';

abstract class EducationLocalDataSource {

  Future<ShowEducationModel> showEducation();

  Future<void> clearEducation();

  Future<void> setEducation(List<Education>? educations);

}

class EducationLocalDataSourceImpl implements EducationLocalDataSource {

  late AppDatabase database;

  EducationLocalDataSourceImpl();

  initDB() async {
    database = await $FloorAppDatabase
        .databaseBuilder(AppConst.sqfliteDB)//
        .build();
  }

  EducationDao get educationDao => database.educationDao;

  @override
  Future<ShowEducationModel> showEducation() async {
    var education = await educationDao.getAllEducation();
    ShowEducationModel model = ShowEducationModel(true, education);
    return model;
  }

  @override
  Future<void> clearEducation() async {
    educationDao.deleteAllEducation();
  }

  @override
  Future<void> setEducation(List<Education>? educations) async {
    if(educations == null) return ;
    for(int i = 0; i < educations.length ; ++i){
      educationDao.insertEducation(educations[i]);
    }
  }
}