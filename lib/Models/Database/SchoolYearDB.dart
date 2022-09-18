import 'dart:async';
import 'package:barcode_attendance/Models/DataModels/SchoolYear.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../ViewModels/DataAccessObjects/school_year_dao.dart';

part 'SchoolYearDB.g.dart';

@Database(version: 1, entities: [SchoolYear])
abstract class SchoolYearDatabase extends FloorDatabase {
  SchoolYearDao get schoolYearDao;
}
