import 'package:barcode_attendance/Models/DataModels/Attendance.dart';
import 'package:floor/floor.dart';

/// Ito yung part ng backend kung saan may direct access sa database, andito galing yung queries na
/// isesend sa Attendance Database for processing and the like.
///
/// DAO means Data Access Objects
///
/// Variables to be passed here like 'id' will come from the AttendanceViewModel (AttendanceVM)
/// found in ViewModels folder.

@dao
abstract class AttendanceDao {
  @Query('SELECT * FROM Attendance')
  Future<List<Attendance>> getAllAttendance();

  @Query('SELECT * FROM Attendance WHERE id = :id')
  Stream<Attendance?> findAttendanceById(int id);

  @Query('DELETE FROM Attendance WHERE id = :id')
  Future<Attendance?> deleteAttendance(int id);

  @insert
  Future<void> insertAttendance(Attendance attendance);

  @update
  Future<void> updateAttendance(Attendance attendance);
}
