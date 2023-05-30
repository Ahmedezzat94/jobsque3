import 'package:floor/floor.dart';
import '../../../../domin/entities/recent_job/recent_job_entity.dart';

@dao
abstract class RecentJobDao {

  @Query('SELECT * FROM RecentJob')
  Future<List<RecentJob>> getAllJobs();

  @Query('SELECT * FROM RecentJob WHERE id = :id')
  Stream<RecentJob?> getJobById(int id);

  @insert
  Future<void> insertJob(RecentJob jobs);

  @Query('DELETE FROM RecentJob')
  Future<void> deleteAllJobs();

  @update
  Future<void> updateJob(RecentJob jobs);
}