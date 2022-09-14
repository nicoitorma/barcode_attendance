import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class Attendance {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String user;
  final String name;
  final String details;
  final String timeAndDate;
  final String cutOffTime;

  //constructor
  Attendance(
      {this.id,
      required this.user,
      required this.name,
      required this.details,
      required this.timeAndDate,
      required this.cutOffTime});
}
