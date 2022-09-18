import 'package:barcode_attendance/Models/DataModels/SchoolYear.dart';
import 'package:floor/floor.dart';

@dao
abstract class SchoolYearDao {
  @Query('SELECT * FROM SchoolYear')
  Future<List<SchoolYear>> getAllSchoolYear();

  @Query('SELECT * FROM SchoolYear WHERE id = :id')
  Stream<SchoolYear?> findSchoolYearById(int id);

  @Query('DELETE FROM SchoolYear WHERE id = :id')
  Future<SchoolYear?> deleteSchoolYear(int id);

  @insert
  Future<void> insertSchoolYear(SchoolYear attendance);
}
