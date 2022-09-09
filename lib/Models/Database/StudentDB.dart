import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../DataModels/Student.dart';
import '../../ViewModels/DataAccessObjects/student_dao.dart';

part 'StudentDB.g.dart';

@Database(version: 1, entities: [Student])
abstract class StudentDatabase extends FloorDatabase {
  StudentDao get studentDao;
}
