import 'package:floor/floor.dart';
import '../../../../domin/entities/all_favorite_entity/all_favorite_entity.dart';

@dao
abstract class AllFavoriteJobDao {

  @Query('SELECT * FROM AllFavoriteJob')
  Future<List<AllFavoriteJob>> getAllFavoriteJob();

  @Query('SELECT * FROM AllFavoriteJob WHERE id = :id')
  Stream<AllFavoriteJob?> getAllFavoriteJobById(int id);

  @insert
  Future<void> insertAllFavoriteJob(AllFavoriteJob jobs);

  @Query('DELETE FROM AllFavoriteJob')
  Future<void> deleteAllFavoriteJob();

  @update
  Future<void> updateAllFavoriteJob(AllFavoriteJob jobs);
}