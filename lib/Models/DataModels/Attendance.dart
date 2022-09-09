import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class Attendance {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String details;
  final String timeAndDate;

  //constructor
  Attendance(
      {this.id,
      required this.name,
      required this.details,
      required this.timeAndDate});
}
