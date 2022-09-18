import 'package:barcode_attendance/Views/LogIn.dart';
import 'package:barcode_attendance/Views/attendance_page.dart';
import 'package:flutter/material.dart';

import 'Models/Database/AttendanceDB.dart';
import 'Views/home_page.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // For attendanceDB or normal user
//   final database =
//       await $FloorAttendanceDatabase.databaseBuilder('AttendanceDB.db').build();
//   final attendanceDao = database.attendanceDao;
//
//   //For studentDB or admin access
//   //TODO: add studentDB, and check if user is admin or not
//
//   //runApp(AttendancePage(attendanceDao: attendanceDao));
//
// }

void main() {
  runApp(const HomePage());
}
