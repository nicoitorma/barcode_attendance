import 'package:barcode_attendance/Views/AttendancePage.dart';
import 'package:flutter/material.dart';

import 'Models/Database/AttendanceDB.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // For attendanceDB or normal user
  final database =
      await $FloorAttendanceDatabase.databaseBuilder('AttendanceDB.db').build();
  final attendanceDao = database.attendanceDao;

  //For studentDB or admin access
  //TODO: add studentDB and check if user is admin or not

  runApp(AttendancePage(attendanceDao: attendanceDao));
}
