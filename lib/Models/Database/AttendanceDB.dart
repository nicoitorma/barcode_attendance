import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../DataModels/Attendance.dart';
import '../../ViewModels/DataAccessObjects/attendance_dao.dart';

part 'AttendanceDB.g.dart';

@Database(version: 1, entities: [Attendance])
abstract class AttendanceDatabase extends FloorDatabase {
  AttendanceDao get attendanceDao;
}
