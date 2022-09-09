import 'package:barcode_attendance/Models/DataModels/Student.dart';
import 'package:floor/floor.dart';

@dao
abstract class StudentDao {
  @Query('SELECT * FROM Student')
  Future<List<Student>> selectAllStudent();

  @Query('SELECT * FROM Student WHERE idNumber = :id')
  Stream<Student?> findStudentById(int id);

  @Query('DELETE FROM Student WHERE idNumber = :id')
  Future<Student?> deleteStudent(int id);

  @insert
  Future<void> insertStudent(Student student);

  @update
  Future<void> updateStudent(Student student);
}
