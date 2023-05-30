import 'package:floor/floor.dart';

import '../../../../domin/entities/suggested_job/suggested_job_entity.dart';

@dao
abstract class SuggestedJobDao {

  @Query('SELECT * FROM SuggestedJob')
  Future<List<SuggestedJob>> getAllJobs();

  @Query('SELECT * FROM SuggestedJob WHERE id = :id')
  Stream<SuggestedJob?> getJobById(int id);

  @insert
  Future<void> insertJob(SuggestedJob job);

  @Query('DELETE FROM SuggestedJob')
  Future<void> deleteAllJobs();

  @update
  Future<void> updateJob(SuggestedJob job);
}